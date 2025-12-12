FROM dart:stable AS appbuilder
WORKDIR /root

# Setup apt packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    git \
    gnupg \
    curl \
    file \
    unzip \
    wget \
    xz-utils \
    zip

# # Setup flutter
RUN mkdir tools && \
    git clone --depth 1 --single-branch https://github.com/flutter/flutter.git -b 3.38.4
RUN echo "export PATH=$HOME/flutter/bin:$PATH" >> .bashrc
RUN $HOME/flutter/bin/flutter
