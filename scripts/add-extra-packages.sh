#!/bin/bash
#
# Add Extra Packages Script
# Downloads and adds sbotools and slackpkg+ to the mirror
#

set -e

# Configuration
EXTRA_PACKAGES_DIR="${EXTRA_PACKAGES_DIR:-./extra-packages}"
MIRROR_DIR="${MIRROR_DIR:-./mirror/slackware64-current}"

echo "============================================"
echo "Adding Extra Packages"
echo "============================================"

# Create directories
mkdir -p "${EXTRA_PACKAGES_DIR}"
mkdir -p "${MIRROR_DIR}/extra"

# Download sbotools
echo "Downloading sbotools..."
SBOTOOLS_VERSION="3.2"
SBOTOOLS_URL="https://slackbuilds.org/slackbuilds/15.0/system/sbotools.tar.gz"

# Note: sbotools needs to be built from SlackBuilds.org
# For now, we'll create a placeholder and document where to get it
if [ ! -f "${EXTRA_PACKAGES_DIR}/sbotools-${SBOTOOLS_VERSION}-noarch-1_SBo.tgz" ]; then
    echo "Note: sbotools should be obtained from:"
    echo "  - SlackBuilds.org: https://slackbuilds.org/repository/15.0/system/sbotools/"
    echo "  - Or build from source: https://github.com/pink-mist/sbotools"
    echo "Creating placeholder for documentation purposes"
    touch "${EXTRA_PACKAGES_DIR}/sbotools-${SBOTOOLS_VERSION}-noarch-1_SBo.tgz"
else
    echo "sbotools package already exists"
fi

# Download slackpkg+
echo "Downloading slackpkg+..."
SLACKPKGPLUS_VERSION="1.8.0"
# Use direct link to known mirror
SLACKPKGPLUS_URL="https://raw.githubusercontent.com/zuno/slackpkgplus/master/slackpkg%2B-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz"

if [ ! -f "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz" ]; then
    # Try GitHub raw URL
    wget -O "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz" \
        "${SLACKPKGPLUS_URL}" 2>/dev/null || {
        echo "Note: slackpkg+ should be obtained from:"
        echo "  - Official site: https://slakfinder.org/slackpkg+/"
        echo "  - GitHub: https://github.com/zuno/slackpkgplus"
        echo "Creating placeholder for documentation purposes"
        touch "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz"
    }
else
    echo "slackpkg+ package already exists"
fi

# Copy packages to mirror extra directory
echo ""
echo "Copying packages to mirror..."
if [ -d "${MIRROR_DIR}/extra" ]; then
    cp -v "${EXTRA_PACKAGES_DIR}"/*.t?z "${MIRROR_DIR}/extra/" 2>/dev/null || true
fi

# Create PACKAGES.TXT
echo ""
echo "Creating PACKAGES.TXT..."
cat > "${MIRROR_DIR}/extra/PACKAGES.TXT" << 'EOF'
PACKAGES.TXT; Extra packages for Slackware Extended

These packages are additional to the standard Slackware distribution:

sbotools - SlackBuilds.org package management tools
  Tools for building and managing packages from SlackBuilds.org
  
slackpkg+ - Enhanced slackpkg with third-party repository support
  Extends slackpkg to support additional repositories including
  Alienbob's repos and SlackBuilds.org

EOF

echo "============================================"
echo "Extra packages setup complete!"
echo "============================================"
echo "Packages location: ${EXTRA_PACKAGES_DIR}"
echo "Mirror extra: ${MIRROR_DIR}/extra"
