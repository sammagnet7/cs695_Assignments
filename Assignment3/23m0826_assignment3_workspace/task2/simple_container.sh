#!/bin/bash

SIMPLE_CONTAINER_ROOT=container_root

mkdir -p $SIMPLE_CONTAINER_ROOT

gcc -o container_prog container_prog.c

## Subtask 1: Execute in a new root filesystem

cp container_prog $SIMPLE_CONTAINER_ROOT/

# 1.1: Copy any required libraries to execute container_prog to the new root container filesystem 

list="$(ldd ./container_prog | egrep -o '/lib.*\.[0-9]')"
for i in $list; do cp -v --parents "$i" "${SIMPLE_CONTAINER_ROOT}"; done >/dev/null

echo -e "\n\e[1;32mOutput Subtask 2a\e[0m"
# 1.2: Execute container_prog in the new root filesystem using chroot. You should pass "subtask1" as an argument to container_prog

sudo chroot $SIMPLE_CONTAINER_ROOT /container_prog subtask1

echo "__________________________________________"
echo -e "\n\e[1;32mOutput Subtask 2b\e[0m"
## Subtask 2: Execute in a new root filesystem with new PID and UTS namespace
# The pid of container_prog process should be 1
# You should pass "subtask2" as an argument to container_prog

sudo unshare --pid --fork --uts chroot $SIMPLE_CONTAINER_ROOT /container_prog subtask2
# Here --mount-proc is redundant since util-linux version 2.27 automatically sets propagation to private in a new mount namespace to make sure that the new namespace is really unshared 

echo -e "\nHostname in the host: $(hostname)"


## Subtask 3: Execute in a new root filesystem with new PID, UTS and IPC namespace + Resource Control
# Create a new cgroup and set the max CPU utilization to 50% of the host CPU. (Consider only 1 CPU core)

if ! mountpoint -q /sys/fs/cgroup; then
    sudo mount -t cgroup2 none /sys/fs/cgroup
fi

echo "+cpu" | sudo tee /sys/fs/cgroup/cgroup.subtree_control >/dev/null
echo "+cpuset" | sudo tee /sys/fs/cgroup/cgroup.subtree_control >/dev/null

sudo mkdir -p /sys/fs/cgroup/cpu_23m0826/

echo "0" | sudo tee /sys/fs/cgroup/cpu_23m0826/cpuset.cpus >/dev/null

echo "500000 1000000" |sudo tee /sys/fs/cgroup/cpu_23m0826/cpu.max >/dev/null
#echo "1000000" |sudo tee /sys/fs/cgroup/cpu_23m0826/cpu.cfs_period_us >/dev/null
#echo "500000" |sudo tee /sys/fs/cgroup/cpu_23m0826/cpu.cfs_quota_us >/dev/null


echo "__________________________________________"
echo -e "\n\e[1;32mOutput Subtask 2c\e[0m"
# Assign pid to the cgroup such that the container_prog runs in the cgroup
# Run the container_prog in the new root filesystem with new PID, UTS and IPC namespace
# You should pass "subtask1" as an argument to container_prog

echo $$ |sudo tee /sys/fs/cgroup/cpu_23m0826/cgroup.procs >/dev/null
sudo unshare --pid --fork --uts --ipc --mount-proc chroot $SIMPLE_CONTAINER_ROOT /container_prog subtask3

# Remove the cgroup

echo $$ |sudo tee /sys/fs/cgroup/cgroup.procs >/dev/null
sudo rmdir /sys/fs/cgroup/cpu_23m0826 >/dev/null

# If mounted dependent libraries, unmount them, else ignore
rm -r $SIMPLE_CONTAINER_ROOT
rm container_prog
