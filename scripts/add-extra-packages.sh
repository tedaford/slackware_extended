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
SBOTOOLS_VERSION="3.0"
SBOTOOLS_URL="https://github.com/pink-mist/sbotools/releases/download/${SBOTOOLS_VERSION}/sbotools-${SBOTOOLS_VERSION}-noarch-1_SBo.tgz"

if [ ! -f "${EXTRA_PACKAGES_DIR}/sbotools-${SBOTOOLS_VERSION}-noarch-1_SBo.tgz" ]; then
    wget -O "${EXTRA_PACKAGES_DIR}/sbotools-${SBOTOOLS_VERSION}-noarch-1_SBo.tgz" \
        "${SBOTOOLS_URL}" || {
        echo "Note: Could not download sbotools from GitHub releases"
        echo "Package will need to be added manually"
    }
else
    echo "sbotools package already exists"
fi

# Download slackpkg+
echo "Downloading slackpkg+..."
SLACKPKGPLUS_VERSION="1.8.0"
SLACKPKGPLUS_URL="https://sourceforge.net/projects/slackpkgplus/files/packages/slackpkg%2B-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz/download"

if [ ! -f "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz" ]; then
    wget -O "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz" \
        "${SLACKPKGPLUS_URL}" || {
        echo "Note: Could not download slackpkg+ from SourceForge"
        echo "Trying alternative download method..."
        # Alternative URL
        ALT_URL="https://slakfinder.org/slackpkg+/pkg/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz"
        wget -O "${EXTRA_PACKAGES_DIR}/slackpkg+-${SLACKPKGPLUS_VERSION}-noarch-3mt.txz" \
            "${ALT_URL}" || {
            echo "Package will need to be added manually"
        }
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
