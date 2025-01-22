FROM ubuntu:noble-20241118.1

ENV DEBIAN_FRONTEND=noninteractive

# Install some applications for debugging and testing
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        ash=0.5.12-6ubuntu5 \
        bc=1.07.1-3ubuntu4 \
        busybox-static=1:1.36.1-6ubuntu3.1 \
        ca-certificates=20240203 \
        curl=8.5.0-2ubuntu10.6 \
        device-tree-compiler=1.7.0-2build1 \
        htop=3.3.0-4build1 \
        iputils-ping=3:20240117-1build1 \
        jq=1.7.1-3build1 \
        libatomic1=14.2.0-4ubuntu2~24.04 \
        lua-socket=3.1.0-1 \
        lua5.4=5.4.6-3build2 \
        micropython=1.22.1+ds-1build2 \
        ncdu=1.19-0.1 \
        psmisc=23.7-1build1 \
        sqlite3=3.45.1-1ubuntu2 \
        strace=6.8-0ubuntu2 \
        stress-ng=0.17.06-1build1 \
        tmux=3.4-1ubuntu0.1 \
        vim-tiny=2:9.1.0016-1ubuntu7.6 \
        xxd=2:9.1.0016-1ubuntu7.6

# Install guest tools
ADD --chmod=644 https://edubart.github.io/linux-packages/apt/keys/cartesi-deb-key.gpg.bin /etc/apt/trusted.gpg.d/cartesi-deb-key.gpg
ADD --chmod=644 https://edubart.github.io/linux-packages/apt/stable/sources.list /etc/apt/sources.list.d/cartesi-deb-apt.list
RUN apt-get update && \
    apt-get install --no-install-recommends -y cartesi-machine-guest-tools=0.17.0-1

# Set hostname
RUN echo "cartesi-machine" > /etc/hostname

# Enable colored terminal
RUN sed -i 's|#force_color_prompt=yes|force_color_prompt=yes|' /root/.bashrc && \
    sed -i 's|#force_color_prompt=yes|force_color_prompt=yes|' /home/dapp/.bashrc

# Remove unreproducible files and shrink image size
RUN rm -rf /var/cache/* /var/lib/apt/lists/* /var/log/*
