FROM alpine:3.21.2

# Install some applications for debugging and testing
RUN apk update && \
    apk add \
        bc=1.07.1-r5 \
        busybox=1.37.0-r9 \
        curl=8.11.1-r0 \
        dtc=1.7.0-r2 \
        e2fsprogs-extra=1.47.1-r1 \
        htop=3.3.0-r0 \
        jq=1.7.1-r0 \
        lua5.4-socket=3.1.0-r1 \
        lua5.4=5.4.7-r0 \
        micropython=1.24.1-r0 \
        ncdu=1.21-r0 \
        sqlite=3.47.1-r0 \
        strace=6.12-r0 \
        stress-ng=0.18.07-r0 \
        tmux=3.5a-r0

# Install guest tools
ADD --chmod=644 https://edubart.github.io/linux-packages/apk/keys/cartesi-apk-key.rsa.pub /etc/apk/keys/cartesi-apk-key.rsa.pub
RUN echo "https://edubart.github.io/linux-packages/apk/stable" >> /etc/apk/repositories
RUN apk update && \
    apk add cartesi-machine-guest-tools=0.17.0-r1

# Set hostname
RUN echo "cartesi-machine" > /etc/hostname

# Remove unreproducible files and shrink image size
RUN rm -rf /var/cache/apk
