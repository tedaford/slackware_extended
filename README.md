# Slackware Extended

A mirror of Slackware-current x86_64 with additional packages for an enhanced Slackware experience.

## Overview

This repository mirrors Slackware-current x86_64 and includes additional packages such as:
- **sbotools** - SlackBuilds.org package management tools
- **slackpkg+** - Enhanced package manager for Slackware

The repository is automatically synchronized with official Slackware mirrors and includes GitHub Actions workflows to:
- Sync with Slackware-current mirrors
- Create custom ISO images
- Publish releases to archive.org

## Quick Start

See [QUICKSTART.md](QUICKSTART.md) for a quick guide to getting started.

## Features

- Full mirror of Slackware-current x86_64
- Additional curated packages
- Automated mirror synchronization
- ISO creation via GitHub Actions
- Easy access to extended Slackware packages

## Documentation

- **[Quick Start Guide](QUICKSTART.md)** - Get started quickly
- **[Mirror Setup](docs/mirror-setup.md)** - Configure and maintain the mirror
- **[ISO Creation](docs/iso-creation.md)** - Build custom ISOs
- **[GitHub Actions](docs/workflows.md)** - Automation workflows
- **[Contributing](CONTRIBUTING.md)** - How to contribute

## Usage

This repository serves as a package mirror and ISO builder. ISOs created from this repository will be published on archive.org for public access.

### Using the Mirror

The mirror is synced daily with Slackware-current. Download ISOs from the [Releases](https://github.com/tedaford/slackware_extended/releases) page.

### Building Your Own

```bash
# Clone the repository
git clone https://github.com/tedaford/slackware_extended.git
cd slackware_extended

# Sync the mirror (requires ~15 GB)
bash scripts/sync-mirror.sh

# Add extra packages
bash scripts/add-extra-packages.sh
```

## Automation

### GitHub Actions Workflows

- **Mirror Sync**: Runs daily at 2 AM UTC
- **ISO Build**: Runs weekly on Sundays at 3 AM UTC

Both workflows can be triggered manually from the Actions tab.

## Requirements

- x86_64 system
- rsync and wget for mirror sync
- xorriso and genisoimage for ISO creation
- 20+ GB disk space for full mirror

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under GPLv2. See [LICENSE](LICENSE) for details.

## Acknowledgments

- Patrick Volkerding and the Slackware team
- The Slackware community
- All contributors
