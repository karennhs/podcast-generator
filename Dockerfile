FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites, add the PPA, and install Python 3.10
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.10 python3.10-venv python3.10-dev \
    && rm -rf /var/lib/apt/lists/*

# Verify installation
RUN python3.10 --version

#RUN pip3 install PyYAML
RUN pip3 install --no-cache-dir "PyYAML>=6.0.1"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
