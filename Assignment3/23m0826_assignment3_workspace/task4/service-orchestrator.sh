#!/bin/bash

# Complete this script to deploy external-service and counter-service in two separate containers
# You will be using the conductor tool that you completed in task 3.
echo -e "\n\e[1;95mThis script approximately takes 8 mins to run completely with 2 cpus with pre-copied image(means extra time will be needed if image also need to be downloaded). Please wait until then.\e[0m\n"

# Creating link to the tool within this directory
    ln -s ../task3/conductor.sh conductor.sh
    ln -s ../task3/config.sh config.sh

# use the above scripts to accomplish the following actions -

# Logical actions to do:
# 1. Build image for the container
    sudo ./conductor.sh build image_23m0826
    echo -e "\n------------------Done #1------------------\n"
# 2. Run two containers say c1 and c2 which should run in background. Tip: to keep the container running
#    in background you should use a init program that will not interact with the terminal and will not
#    exit. e.g. sleep infinity, tail -f /dev/null

    sudo ./conductor.sh run image_23m0826 c1 "nohup tail -f /dev/null" &
    sudo ./conductor.sh run image_23m0826 c2 "nohup tail -f /dev/null" &
    echo "sleeping 30 secs for "run" command to finish"
    sleep 30
    echo -e "\n------------------Done #2------------------\n"

# 3. Copy directory external-service to c1 and counter-service to c2 at appropriate location. You can
#    put these directories in the containers by copying them within ".containers/{c1,c2}/rootfs/" directory
    
    
    sudo cp -r external-service .containers/c1/rootfs/
    sudo chmod -R 755 .containers/c1/rootfs/external-service
    sudo cp /etc/resolv.conf .containers/c1/rootfs/etc/resolv.conf

    sudo cp -r counter-service .containers/c2/rootfs/
    sudo chmod -R 755 .containers/c2/rootfs/counter-service
    sudo cp /etc/resolv.conf .containers/c2/rootfs/etc/resolv.conf

    echo -e "\n------------------Done #3------------------\n"

# 4. Configure network such that:
#    4.a: c1 is connected to the internet and c1 has its port 8080 forwarded to port 3000 of the host
    sudo ./conductor.sh addnetwork c1 -i -e 8080-3000

#    4.b: c2 is connected to the internet and does not have any port exposed
    sudo ./conductor.sh addnetwork c2 -i

#    4.c: peer network is setup between c1 and c2
    sudo ./conductor.sh peer c1 c2

    echo -e "\n------------------Done #4------------------\n"

# 5. Get ip address of c2. You should use script to get the ip address. 
#    You can use ip interface configuration within the host to get ip address of c2 or you can 
#    exec any command within c2 to get it's ip address

    c2_IP=$( sudo ./conductor.sh exec c2 "hostname -I" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' )
    URL="http://${c2_IP}:8080"

    echo -e "\n------------------Done #5------------------\n"

# 6. Within c2 launch the counter service using exec [path to counter-service directory within c2]/run.sh
    
    sudo ./conductor.sh exec c2 "apt install lsof"
    # sudo ./conductor.sh exec c2 "apt install curl -y"  

    sudo ./conductor.sh exec c2 "counter-service/run.sh > server.log 2>&1 &"

    cmd_LISTEN="lsof -nP -i:8080 | grep -c LISTEN"
    while true; do
        result=$( sudo ./conductor.sh exec c2 "bash -c \"$cmd_LISTEN\"" | tail -n 1 | grep -oE '[0-9]+' )

        if [ "$result" -gt 0 ]; then
            echo "counter-service UP and Running!"
            break
        fi

        echo "Waiting for counter-service to be UP >>>"
        sleep 5
    done

    echo -e "\n------------------Done #6------------------\n"

# 7. Within c1 launch the external service using exec [path to external-service directory within c1]/run.sh

    sudo ./conductor.sh exec c1 "apt install lsof -y"
    # sudo ./conductor.sh exec c1 "apt install curl -y"

    cmd_ext_serv="nohup external-service/run.sh $URL  > server.log 2>&1 &"

    sudo ./conductor.sh exec c1 "bash -c \"$cmd_ext_serv\""

    cmd_LISTEN="lsof -nP -i:8080 | grep -c LISTEN"
    while true; do
        result=$( sudo ./conductor.sh exec c1 "bash -c \"$cmd_LISTEN\"" | tail -n 1 | grep -oE '[0-9]+' )

        if [ "$result" -gt 0 ]; then
            echo "external-service UP and Running!"
            break
        fi

        echo "Waiting for external-service to be UP >>>"
        sleep 5
    done

    echo -e "\n------------------Done #7------------------\n"

# 8. Within your host system open/curl the url: http://localhost:3000 to verify output of the service

    own_ip=$(hostname -I | cut -d ' ' -f 1)
    sudo apt install curl -y

    for ((i=1; i<=5; i++)); do
        echo "Running iteration $i"
        curl "http://${own_ip}:3000"
        echo "Iteration $i completed"
    done

    echo -e "\n------------------Done #8------------------\n"

# 9. On any system which can ping the host system open/curl the url: `http://<host-ip>:3000` to verify
#    output of the service

# 10. Removing all the containers and mount points:
    # echo -e "\n\n Removing all the setup \n"
    # sudo ./conductor.sh stop c1
    # sudo ./conductor.sh stop c2
    # sudo rm -rf .containers extras conductor.sh config.sh

    echo -e "\n------------------DONE------------------\n"