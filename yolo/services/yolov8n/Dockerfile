FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TZ=Europe/Moscow

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get update && \
    apt-get install sudo systemd curl screen gnupg ffmpeg libsm6 libxext6 -y && \
    useradd -m docker && \
    echo "docker:docker" | chpasswd && \
    adduser docker sudo
RUN distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - && \
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list && \
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
RUN apt-get install --no-install-recommends -y python3 build-essential python3-pip
RUN pip3 install networkx==3.1 && \
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu113 && \
    pip3 install ultralytics

ENTRYPOINT [ "bash", "/app/scripts/run.sh" ]