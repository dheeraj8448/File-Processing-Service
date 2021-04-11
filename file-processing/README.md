# Solution

## Solution Overview

1. Shell script (process.sh) monitors input directory '/app/incoming' for new files and once detected, it compresses the file and puts into output dircetory '/app/processed'.
2. Done using inotify-tools library.

## Prerequisites

1. AWS Ubuntu EC2 instance
2. Install python 3 in the instance
3. Install ansible in the instance

## To Run

1. ssh into the ec2 instance
2. Checkout the code
3. `ansible-playbook playbook.yaml`

## To Test

1. `sudo docker ps -a` # Will display the running container file-process
2. `sudo docker exec -it file-process bash -c "touch /app/incoming/test.txt"` # Will create a file in the ~/incoming folder
3. `sudo docker exec -it file-process bash -c "ls -lart /app/processed/"` # Will compress the file from ~/incoming folder and put it into ~/processed folder.
4. Events are logged into logfile inside the container.
  `docker exec -it file-process bash -c "cat /app/logfile"`

## To-Do

1. For testing tried using Vagrant - vagrant up, vagrant provision.
2. Had problem with docker-run time in Vagrant environment. 
3. Ansible playbook is working if its ran on ubuntu server. 