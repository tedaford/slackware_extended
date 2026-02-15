# ISO Creation Guide

This guide explains how to create custom Slackware Extended ISO images.

## Overview

The ISO creation process builds bootable Slackware installation media with additional packages pre-included.

## ISO Creation Workflow

The ISO is created automatically via GitHub Actions:
- **Workflow**: `.github/workflows/build-iso.yml`
- **Schedule**: Weekly on Sundays at 3 AM UTC
- **Manual trigger**: Available via workflow_dispatch

## Manual ISO Creation

### Prerequisites

Install required tools:
```bash
sudo apt-get install xorriso genisoimage rsync squashfs-tools
```

### Build Process

1. **Sync the mirror** (if not already done):
   ```bash
   bash scripts/sync-mirror.sh
   ```

2. **Add extra packages**:
   ```bash
   bash scripts/add-extra-packages.sh
   ```

3. **Create ISO structure**:
   ```bash
   mkdir -p iso-work
   # Copy Slackware installer files
   # Copy packages
   # Setup isolinux bootloader
   ```

4. **Generate ISO**:
   ```bash
   genisoimage -o slackware-extended.iso \
     -V "SLACKWARE_EXTENDED" \
     -r -J -joliet-long \
     iso-work/
   ```

5. **Create checksums**:
   ```bash
   md5sum slackware-extended.iso > slackware-extended.iso.md5
   sha256sum slackware-extended.iso > slackware-extended.iso.sha256
   ```

## ISO Contents

The ISO includes:
- Slackware-current x86_64 base system
- Installer and kernel
- sbotools package
- slackpkg+ package
- Additional curated packages

## ISO Features

- Bootable installation media
- Full Slackware installer
- Pre-configured for extended repositories
- Extra packages in /extra directory

## Customization

### Adding More Packages

1. Edit `scripts/add-extra-packages.sh`
2. Add download commands for additional packages
3. Rebuild the ISO

### Customizing Boot Menu

Edit the isolinux configuration:
1. Modify `isolinux/isolinux.cfg`
2. Add custom boot parameters
3. Update boot messages

## Publishing to Archive.org

After ISO creation, the build is published to archive.org for long-term archival and public access.

### Archive.org Setup

To publish ISOs to archive.org:

1. Create an archive.org account
2. Create a collection for Slackware Extended
3. Configure GitHub Actions secrets:
   - `ARCHIVE_ORG_ACCESS_KEY`
   - `ARCHIVE_ORG_SECRET_KEY`
4. ISOs will be automatically uploaded

### Manual Upload

To manually upload to archive.org:
```bash
ia upload slackware-extended-YYYYMMDD \
  slackware-extended.iso \
  --metadata="title:Slackware Extended Current" \
  --metadata="collection:opensource" \
  --metadata="mediatype:software"
```

## ISO Testing

Before publishing, test the ISO:
1. Verify checksums match
2. Test in a virtual machine (VirtualBox, QEMU, VMware)
3. Verify boot process
4. Test package installation

## Disk Space Requirements

- ISO creation workspace: ~20 GB
- Final ISO size: ~2-4 GB (depending on included packages)

## Troubleshooting

### ISO Too Large

If the ISO exceeds standard DVD size:
1. Remove unnecessary packages
2. Exclude documentation
3. Compress initrd more aggressively

### Boot Issues

If the ISO doesn't boot:
1. Verify isolinux is properly configured
2. Check kernel and initrd paths
3. Test with different virtual machines

### Package Issues

If packages are missing from the ISO:
1. Verify sync completed successfully
2. Check extra-packages directory
3. Review build logs

## Related Documentation

- [Mirror Setup Guide](./mirror-setup.md)
- [GitHub Actions Workflows](./workflows.md)
