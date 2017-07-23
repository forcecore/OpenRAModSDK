# -t == title of the docker image.
# docker build -t ya .
# docker run ya
#
# Some useful commands:
# docker system prune : clean up images and obsolete containers.
# docker run -t -i ubuntu /bin/bash : run bash interactively.
#
# How to "save" current state of docker:
# docker ps : get what image the docker is running on.
# While the docker instance is running, before the state is destroyed:
# docker commit containerid ya.
# e.g., docker commit 2f6d8586a832 ya

# Use an official Ubuntu images as the parent image
FROM ubuntu

RUN \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | tee /etc/apt/sources.list.d/mono-official.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential git vim tofrodos curl unzip mono-devel zip nsis libtolua-dev lua5.1 lua5.1-dev

# Set the working directory to /app
WORKDIR /sdk

# Copy the current directory contents into the container at /app
ADD . /sdk

# Define environment
ENV HOME /sdk

# Run app.py when the container launches
CMD ["bash"]
