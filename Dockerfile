FROM tensorflow/tensorflow:latest-gpu-jupyter

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Etc/UTC

EXPOSE 4444

WORKDIR /scripts
COPY scripts/ .
RUN ./install_python310.sh

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libglib2.0-0 \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libgl1-mesa-glx \
        wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install pip for Python 3.10
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3.10 get-pip.py && \
    rm get-pip.py


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
# Install OpenCV
RUN python3.10 -m pip install opencv-python tensorflow jupyterlab

WORKDIR /jupyterlab
CMD jupyter lab --port 4444 --allow-root --ip=0.0.0.0
