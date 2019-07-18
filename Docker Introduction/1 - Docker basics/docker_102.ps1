
# Run ubuntu in Windows :-O
docker run -it ubuntu bash
# ....and now we're at a bash terminal!
# -i              : Keep STDIN open even if not attached
# -t              : Allocate a pseudo-tty
# -it             : Shortform of -i -t
# apt-get update
# apt-get install tree
# cd /usr/local
# tree
# exit or Ctrl+C



# Run a second ubuntu instance in a background daemon
# and name the container
docker run -d -it --name second_demo_container ubuntu



# list RUNNING containers
docker ps



# Step into a running container
docker attach ####



# list ALL containers
docker ps -a



## stop
docker stop #####



## start
docker start #####



<#
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    60fb42643036        ubuntu              "bash"              17 minutes ago      Exited (0) 17 seconds ago                       gracious_meninsky
    4ed915f59691        hello-world         "/hello"            19 minutes ago      Exited (0) 19 minutes ago                       reverent_pasteur
#>
# remove containers
docker rm 60fb42643036
#abbreviated version
docker rm 4ed



# show all downloaded images
docker images



# remove a specific image
docker image rm -f ####
