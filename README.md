# Cartesi Machine Image RootFS

The Cartesi Machine Image RootFS is the repository that provides the Docker configuration files to build the `rootfs.ext2` filesystem. This is used to run a Linux environment on the Cartesi Machine Emulator reference implementation for testing purposes. The current image is based on the Ubuntu 24.04 LTS (Noble).

## Getting Started

Users can use the provided root filesystem directly from one of the prepackaged releases, without needing to build this repository themselves.

### Requirements

- Docker 18.x
- GNU Make >= 3.81
- xgenext2fs >= 1.5.6

### Build

```bash
$ make rootfs-ubuntu.ext2
```

This will generated the `rootfs-ubuntu.ext2` image following commands from `rootfs-ubuntu.Dockerfile`. You can then use this image with Cartesi Machine emulator to boot a Linux operating system.

### Makefile targets

See `make help` for all targets.

## Contributing

Thank you for your interest in Cartesi! Head over to our [Contributing Guidelines](CONTRIBUTING.md) for instructions on how to sign our Contributors Agreement and get started with
Cartesi!

Please note we have a [Code of Conduct](CODE_OF_CONDUCT.md), please follow it in all your interactions with the project.

## License

The machine-rootfs-image repository and all contributions are licensed under
[APACHE 2.0](https://www.apache.org/licenses/LICENSE-2.0). Please review our [LICENSE](LICENSE) file.
