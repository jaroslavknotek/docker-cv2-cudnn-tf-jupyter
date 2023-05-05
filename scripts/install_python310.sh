#!/bin/bash

# Update package list
apt update

# Install build-essential package
apt install -y build-essential wget

# Install dependencies
apt install -y libffi-dev libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
                    libreadline-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev \
                    tk-dev uuid-dev libdb-dev

# Download Python 3.10.9 source code
wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz

# Extract source code
tar -xf Python-3.10.9.tgz

# Change into extracted directory
cd Python-3.10.9/

# Configure build
./configure --enable-optimizations

# Compile source code
make -j$(nproc)

# Install Python 3.10.9
make altinstall

# Verify installation
python3.10 --version

cd ..
rm -rf Python-3.10
