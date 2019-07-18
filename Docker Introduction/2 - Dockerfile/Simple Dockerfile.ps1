Set-Location ".\2 - Dockerfile\ubuntu_with_tree"


# Build the contents of this folder using the default dockerfile
# tag the image with the name "ubuntu_with_tree"
docker build -t ubuntu_with_tree .


# Run the new image and attach with bash
docker run -it ubuntu_with_tree /bin/bash



# Another common example
Set-Location "..\whalesay"

docker build -t  whalesay . 

docker run --rm whalesay