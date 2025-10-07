### CS695 Assignment 3 Report: ready, get set, containers!
#### Soumik Dutta (23m0826)
This report details the implementation of docker like system focused on understanding and building container technologies using fundamental Linux primitives. The project was divided into four main tasks, each building on the concepts of the previous one, culminating in the deployment of a simple service-oriented architecture.

***

### Task 1: Namespaces with System Calls

In this task, I explored the use of Linux system calls to create and manage process namespaces. The goal was to demonstrate how process IDs (PIDs) and hostnames are isolated in separate namespaces. I used the `clone` system call to create the first child process in a new UTS (Unix Time-sharing System) and PID namespace. This successfully made the child's PID `1` within its own namespace and allowed its hostname to be changed without affecting the parent process.

The main challenge was creating a second child process and attaching it to the *existing* PID and UTS namespaces of the first child. Since `clone` doesn't have a flag for this purpose, I used `pidfd_open` to get a file descriptor for the first child's PID namespace. I then used `setns` with this file descriptor and the `CLONE_NEWPID` flag to change the parent's PID namespace to that of the first child. Any subsequent child processes forked from the parent would then be in this new namespace. I then forked the second child, and inside its process, used `setns` again with the `CLONE_NEWUTS` flag to join the first child's UTS namespace. This resulted in the second child having a PID of `2` and the same hostname as the first child, as specified in the assignment.

***

### Task 2: CLI Containers

This task focused on building a basic container environment using command-line tools.

* **Subtask 2a (Filesystem Isolation)**: I implemented filesystem isolation using the `chroot`. My script first copied the `container_prog` binary into a designated root directory, `container_root`. To ensure the program ran correctly, I also identified and copied all its dynamic library dependencies using the `ldd` command and the `cp --parents` flag, ensuring all necessary libraries were available at their correct paths within the `chroot` environment.

* **Subtask 2b (PID and UTS Isolation)**: I enhanced the container by adding PID and UTS namespace isolation using `unshare`. By running `unshare` with the `--pid` and `--uts` flags, I created a new process namespace for the container, ensuring that `container_prog` was the first process with a PID of `1` and that the hostname was isolated from the host.

* **Subtask 2c (Resource Control)**: To restrict container resource usage, I used `cgroup v2`. I created a new cgroup and set a CPU utilization limit of 50%. This was achieved by setting the `cpu.max` value to a `quota` of 500,000 within a `period` of 1,000,000 microseconds. The container process was then assigned to this cgroup, ensuring its CPU usage was capped.

***

### Task 3: Containers in the Wild

For this task, I developed a more comprehensive container management tool in `conductor.sh` to mimic the functionality of tools like Docker.

* **Subtask 3a (Implement `run`)**: The `run` command was implemented to start a new container from a given image. The process uses `unshare` to create new PID, UTS, network (NET), mount (MOUNT), and IPC namespaces. I then used `chroot` to set the container's root filesystem. Crucially, I ensured that `procfs`, `sysfs`, and the host's `/dev` directory were mounted inside the container's `rootfs` to allow essential tools like `ps` and `top` to function correctly within the isolated environment.

* **Subtask 3b (Implement `exec`)**: The `exec` command was implemented to execute a new command inside a running container. I used `nsenter` to join the existing namespaces (UTS, PID, NET, MOUNT, IPC) of the running container's `unshare` process. This allowed the new command to be executed within the container's isolated environment, ensuring that tools like `ps` only showed processes running within that specific container.

* **Subtask 3c (Networking)**: The `addnetwork` command provides networking capabilities to a container. I implemented this by creating a **veth** (virtual Ethernet) link, which acts as a peer connection between the host's network namespace and the container's network namespace. I moved one end of the veth pair into the container's namespace and configured IP addresses and routes on both ends. This setup allows traffic to flow between the container and the host. I also configured **NAT** using `iptables` to allow the container to access the internet.

***

### Task 4: Creating the Matrix

In the final task, I applied the `conductor.sh` tool to deploy and manage two separate services within containers.

* **Deployment and Network Setup**: I deployed `external-service` in one container (`c1`) and `counter-service` in another (`c2`). I used `conductor.sh` to build a base image, run the two containers in the background, and then copy the service directories into their respective root filesystems.
* **Networking Configuration**:
    * For `c1`, I configured it to have internet access and exposed its port `8080` to port `3000` on the host, using the `-i` and `-e` options with the `addnetwork` command.
    * For `c2`, I also gave it internet access but did not expose any ports.
    * Finally, I set up a peer network between `c1` and `c2` using the `peer` command, enabling them to communicate directly with each other.
* **Service Interaction**: The `service-orchestrator.sh` script dynamically retrieved the IP address of `c2` by executing `ip a` within its namespace. The script then launched the `counter-service` in `c2` and the `external-service` in `c1`, passing `c2`'s IP address to the latter. This demonstrated a working service-oriented architecture. I verified the setup by running `curl` on the host system at `http://host-ip:3000` to access the `external-service`, which in turn communicated with the `counter-service`.
