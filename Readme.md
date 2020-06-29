# Dockerized OpenSlides

This is a dockerized version of [OpenSlides](https://openslides.com/). You can use it to host small meetings for your club or small bussiness. It is recommended for ~10 concurrent users (users who interact with the software at the very same time), so it should work for gatherings with up to 30 persons.

## Get it up and running

This tutorial will guide you through the installation process step by step. All commands are run in the terminal, so you should have a basic understanding how to interact with your computer via the command line.

The following steps need to be executed on the computer you want to run OpenSlides on!

### Install Docker

This setup of OpenSlides runs inside a Docker container, so make sure that Docker is installed on the computer.

You'll find installation instructions for your operating system here: https://docs.docker.com/get-docker/

### Get the source code

There's several options how to get the source code to your computer depending on what tools you are used to.

#### A) Clone the repository

If you have _Git_ installed on your computer, you can clone the repository:

```sh
$ git clone git@github.com:frederikheld/openslides-dockerized.git
```

This will create the folder `openslides-dockerized` and copy the source code into it.

#### B) wget

If you are on a UNIX system, you most likely have access to `wget`. You can use it to download the Dockerfile from the repository. Make sure to create the directory `openslides-dockerized` first.

```sh
$ mkdir openslides-dockerized
$ cd openslides-dockerized
$ wget https://raw.githubusercontent.com/frederikheld/openslides-dockerized/master/Dockerfile
```

#### C) manual copy & paste

If you are not familiar with such kinds of tools, you can copy & paste the source code manually.

1. Create a folder `openslides-dockerized`
2. Open [https://raw.githubusercontent.com/frederikheld/openslides-dockerized/master/Dockerfile](https://raw.githubusercontent.com/frederikheld/openslides-dockerized/master/Dockerfile) in your browser
3. Select "Save page as..." from the menu and save the page into the folder `openslides-dockerized`. Make sure you choose the name `Dockerfile` (without a file type extension!) for the file before you save it!

### Build an run Docker
The file `Dockerfile` describes a Docker image. This needs to be built first before it can be run as a Docker container. So you have two steps ahead. Make sure that the first one is run inside the directory `openslides-dockerized`. For the second one it doesn't matter where you run it as it will not interact with the file system.

```sh
$ docker build --tag openslides:latest .
$ docker run --name openslides -p 8000:8000 .
```

Depending on your Docker installation, you might need to run those commands with `sudo` privileges.

If you want to run the container in the background (which allows you to close the terminal and keep OpenSlides running), you can add `-d` to the list of parameters of `docker run`.

## But why? OpenSlides already comes with a dockerized version?!

The [official repository](https://github.com/OpenSlides/OpenSlides) comes with instructions on how to install the small version (~10 concurrent users) via Python/pip and instructions on how to install the _Big Mode_ for hosting large conferences with docker-compose. The first one pollutes your environment, the second one is much more complex to get up and running as it isn't a simple docker-compose file but a set of build scripts you need to configure which then create a docker-compose file. This requires a deep understanding of the setup and also a fairly powerful machine to build on (8 GB of RAM recommended).

So I decided to fill the gap and to dockerize the Python/pip version. This makes for a small, self-contained installation of OpenSlides that can be used without knowledge of Python and Python environments.

## Known Issues

- This is installation not configured to used via _https_ yet!

## Contribute

If you have questions or want to contribute to this repository, please create an [issue on GitHub](https://github.com/frederikheld/open-slides/issues) to discuss it!

