# Slackware Extended - Quick Start Guide

This guide will help you get started with the Slackware Extended mirror.

## What is Slackware Extended?

Slackware Extended is a mirror of Slackware-current x86_64 with additional packages pre-configured for easy installation. It tracks the official Slackware mirror and adds commonly needed tools.

## Getting Started

### 1. Using the Mirror

The mirror is automatically synced daily with Slackware-current. To use it:

**Option A: Download from Releases**
- Visit the [Releases](https://github.com/tedaford/slackware_extended/releases) page
- Download the latest ISO image
- Verify checksums (MD5 and SHA256 provided)
- Burn to DVD or create a bootable USB

**Option B: Use as Package Repository**
- Configure your system to use this mirror
- Install additional packages via slackpkg

### 2. Installing Extra Packages

Extra packages are located in the `/extra` directory on the ISO or mirror:

```bash
# Mount the ISO or CD
mount /dev/cdrom /mnt/cdrom

# Install extra packages
cd /mnt/cdrom/extra
installpkg sbotools-*.tgz
installpkg slackpkg+-*.txz
```

### 3. Configuring slackpkg+

After installing slackpkg+, configure it to use additional repositories:

```bash
# Edit the slackpkg+ configuration
vi /etc/slackpkg/slackpkgplus.conf

# Add repositories (example):
REPOPLUS=( slackpkgplus alienbob slacky )

# Update package lists
slackpkg update
```

## Building Your Own ISO

### Prerequisites

- Linux system with 20+ GB free space
- rsync, wget, xorriso, genisoimage installed
- Fast internet connection

### Manual Build

1. Clone this repository:
   ```bash
   git clone https://github.com/tedaford/slackware_extended.git
   cd slackware_extended
   ```

2. Sync the mirror:
   ```bash
   bash scripts/sync-mirror.sh
   ```
   *Note: This will download ~12-15 GB of data*

3. Add extra packages:
   ```bash
   bash scripts/add-extra-packages.sh
   ```

4. Create the ISO:
   ```bash
   # Follow instructions in docs/iso-creation.md
   ```

### Automated Build (GitHub Actions)

The repository includes GitHub Actions workflows that automatically:
- Sync the mirror daily
- Build ISOs weekly
- Create releases

To trigger a build manually:
1. Go to the Actions tab
2. Select "Build Slackware ISO"
3. Click "Run workflow"

## Additional Resources

### Documentation

- [Mirror Setup Guide](docs/mirror-setup.md) - Detailed mirror configuration
- [ISO Creation Guide](docs/iso-creation.md) - Complete ISO building instructions
- [GitHub Actions Workflows](docs/workflows.md) - Automation documentation
- [Contributing Guide](CONTRIBUTING.md) - How to contribute

### Slackware Resources

- Official Slackware: https://www.slackware.com/
- SlackBuilds.org: https://slackbuilds.org/
- Slackware Documentation: https://docs.slackware.com/
- LinuxQuestions Slackware Forum: https://www.linuxquestions.org/questions/slackware-14/

### Getting Help

- Open an [issue](https://github.com/tedaford/slackware_extended/issues) for bugs or questions
- Check existing issues for solutions
- Join the Slackware community forums

## System Requirements

### Minimum Requirements
- x86_64 processor
- 1 GB RAM (2 GB recommended)
- 10 GB disk space (20 GB recommended)
- CD/DVD drive or USB boot capability

### Recommended Requirements
- Modern x86_64 processor (Intel/AMD)
- 4 GB+ RAM
- 50 GB+ disk space
- Fast internet connection for updates

## Installation Tips

1. **Backup your data** before installation
2. **Read the documentation** - Slackware requires some Linux knowledge
3. **Choose a simple partition layout** for beginners (single root partition + swap)
4. **Install all package sets** for a complete system (or at least A, AP, D, L, N)
5. **Configure LILO or GRUB** carefully for boot loader
6. **Set up networking** during or after installation

## Post-Installation

After installing Slackware Extended:

1. **Update the system**:
   ```bash
   slackpkg update
   slackpkg upgrade-all
   ```

2. **Install sbotools** for SlackBuilds.org access:
   ```bash
   installpkg /path/to/sbotools-*.tgz
   sboconfig -c
   ```

3. **Configure slackpkg+** for additional repositories

4. **Install common software**:
   ```bash
   slackpkg install firefox
   slackpkg install libreoffice
   # etc.
   ```

## Troubleshooting

### Mirror Sync Issues
- Check internet connectivity
- Try alternative mirrors in `mirror-config.conf`
- Review sync logs for errors

### ISO Build Failures
- Ensure sufficient disk space (20+ GB)
- Verify all prerequisites are installed
- Check GitHub Actions logs for details

### Package Installation Issues
- Verify package compatibility with current
- Check dependencies
- Review package documentation

## License

This project is licensed under GPLv2. See [LICENSE](LICENSE) for details.

Slackware is a registered trademark of Patrick Volkerding.

## Acknowledgments

- Patrick Volkerding and the Slackware team
- SlackBuilds.org maintainers
- The Slackware community
- All contributors to this project
