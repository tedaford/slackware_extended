# Extra Packages Directory

This directory contains additional packages that extend the standard Slackware-current distribution.

## Included Packages

### sbotools
**Version**: 3.2+  
**Purpose**: SlackBuilds.org package management tools

**How to obtain**:
1. From SlackBuilds.org: https://slackbuilds.org/repository/15.0/system/sbotools/
2. Build from source: https://github.com/pink-mist/sbotools
3. Download pre-built from trusted Slackware repositories

**Installation**:
```bash
installpkg sbotools-*.tgz
```

### slackpkg+
**Version**: 1.8.0+  
**Purpose**: Enhanced slackpkg with third-party repository support

**How to obtain**:
1. Official repository: https://slakfinder.org/slackpkg+/
2. GitHub: https://github.com/zuno/slackpkgplus
3. Download from Slackware community repositories

**Installation**:
```bash
installpkg slackpkg+-*.txz
```

## Adding Your Own Packages

To add custom packages to this mirror:

1. Place your `.txz`, `.tgz`, `.tbz`, or `.tlz` packages in this directory
2. Run the add-extra-packages script:
   ```bash
   bash scripts/add-extra-packages.sh
   ```
3. Packages will be copied to `mirror/slackware64-current/extra/`

## Package Requirements

Packages should be:
- Compatible with Slackware-current x86_64
- Properly formatted as Slackware packages
- Include necessary metadata (SLACK-DESC, etc.)
- Signed if possible for security

## Package Sources

Recommended sources for Slackware packages:
- SlackBuilds.org - https://slackbuilds.org/
- Alien's Repository - http://www.slackware.com/~alien/
- SlackOnly - https://slackonly.com/
- Slackel.gr - http://www.slackel.gr/

## Building Packages

To build packages from SlackBuilds:
```bash
# 1. Download the SlackBuild
wget https://slackbuilds.org/slackbuilds/15.0/system/sbotools.tar.gz
tar xvf sbotools.tar.gz
cd sbotools

# 2. Download the source
wget <source-url>

# 3. Build the package
bash sbotools.SlackBuild

# 4. Move the resulting package
mv /tmp/sbotools-*.tgz /path/to/extra-packages/
```

## Automated Downloads

The `scripts/add-extra-packages.sh` script attempts to automatically download packages. Due to network restrictions or availability issues, some downloads may fail. In such cases:

1. Manually download the packages
2. Place them in this directory
3. Re-run the script to copy them to the mirror

## Notes

- Package versions may need to be updated periodically
- Always verify package checksums and signatures
- Test packages before including in the mirror
- Document any custom packages in PACKAGES.TXT
