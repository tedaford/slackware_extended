# Mirror Setup Guide

This guide explains how to set up and maintain the Slackware Extended mirror.

## Overview

The Slackware Extended project mirrors Slackware-current x86_64 and adds additional packages for enhanced functionality.

## Mirror Structure

```
mirror/
└── slackware64-current/
    ├── slackware64/        # Core Slackware packages
    ├── extra/              # Additional packages
    ├── kernels/            # Kernel packages
    ├── isolinux/           # Boot files
    └── MIRROR_INFO         # Mirror metadata
```

## Manual Mirror Sync

To manually sync the mirror:

```bash
bash scripts/sync-mirror.sh
```

This will:
1. Connect to official Slackware mirrors
2. Download slackware64-current packages
3. Exclude unnecessary components (source, testing, pasture)
4. Create mirror metadata

## Adding Extra Packages

To add extra packages (sbotools, slackpkg+):

```bash
bash scripts/add-extra-packages.sh
```

This will:
1. Download the latest versions of sbotools and slackpkg+
2. Place them in the extra-packages directory
3. Copy them to the mirror's extra directory
4. Generate PACKAGES.TXT

## Automated Sync

The mirror is automatically synced daily via GitHub Actions:
- **Workflow**: `.github/workflows/sync-mirror.yml`
- **Schedule**: Daily at 2 AM UTC
- **Manual trigger**: Available via workflow_dispatch

## Mirror Sources

Primary mirrors used:
- rsync://rsync.osuosl.org/slackware/slackware64-current/
- rsync://mirrors.slackware.com/slackware/slackware64-current/
- rsync://ftp.slackware.pl/slackware/slackware64-current/

## Space Requirements

A full mirror of slackware64-current requires approximately:
- **Core packages**: ~12-15 GB
- **Extra packages**: ~50-100 MB
- **Total**: ~13-16 GB

## Customization

### Adding Your Own Packages

1. Place your custom packages in `extra-packages/`
2. Run the add-extra-packages script
3. Update PACKAGES.TXT with package descriptions

### Modifying Sync Behavior

Edit `scripts/sync-mirror.sh` to:
- Add/remove rsync excludes
- Change mirror sources
- Adjust sync options

## Troubleshooting

### Sync Failures

If mirror sync fails:
1. Check network connectivity
2. Verify mirror availability
3. Check disk space
4. Review rsync errors in logs

### Package Download Issues

If extra packages fail to download:
1. Check package URLs in `scripts/add-extra-packages.sh`
2. Verify package versions are available
3. Download manually if needed

## Related Documentation

- [ISO Creation Guide](./iso-creation.md)
- [GitHub Actions Workflows](./workflows.md)
