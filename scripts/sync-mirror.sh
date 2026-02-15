#!/bin/bash
#
# Slackware-current x86_64 Mirror Sync Script
# Syncs Slackware-current from official mirrors
#

set -e

# Configuration
SLACKWARE_VERSION="slackware64-current"
MIRROR_BASE_URL="https://mirrors.slackware.com/slackware/${SLACKWARE_VERSION}/"
LOCAL_MIRROR_DIR="${LOCAL_MIRROR_DIR:-./mirror/${SLACKWARE_VERSION}}"
RSYNC_OPTS="-avz --delete --stats --progress"

# Alternative mirrors (in case primary is unavailable)
MIRROR_URLS=(
    "rsync://rsync.osuosl.org/slackware/${SLACKWARE_VERSION}/"
    "rsync://mirrors.slackware.com/slackware/${SLACKWARE_VERSION}/"
    "rsync://ftp.slackware.pl/slackware/${SLACKWARE_VERSION}/"
)

echo "============================================"
echo "Slackware-current x86_64 Mirror Sync"
echo "============================================"
echo "Target directory: ${LOCAL_MIRROR_DIR}"
echo ""

# Create mirror directory if it doesn't exist
mkdir -p "${LOCAL_MIRROR_DIR}"

# Try each mirror until one succeeds
sync_success=false
for mirror_url in "${MIRROR_URLS[@]}"; do
    echo "Attempting to sync from: ${mirror_url}"
    echo ""
    
    if rsync ${RSYNC_OPTS} \
        --exclude='source/' \
        --exclude='testing/' \
        --exclude='pasture/' \
        --exclude='extra/' \
        --exclude='*.iso' \
        "${mirror_url}" "${LOCAL_MIRROR_DIR}/"; then
        sync_success=true
        echo ""
        echo "Successfully synced from: ${mirror_url}"
        break
    else
        echo "Failed to sync from: ${mirror_url}"
        echo "Trying next mirror..."
        echo ""
    fi
done

if [ "$sync_success" = false ]; then
    echo "ERROR: Failed to sync from all mirrors"
    exit 1
fi

# Create MIRROR_INFO file
cat > "${LOCAL_MIRROR_DIR}/MIRROR_INFO" << EOF
Mirror Information
==================
Last Synced: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
Slackware Version: ${SLACKWARE_VERSION}
Architecture: x86_64
Mirror Type: Extended (includes additional packages)
EOF

echo ""
echo "============================================"
echo "Mirror sync completed successfully!"
echo "============================================"
echo "Mirror location: ${LOCAL_MIRROR_DIR}"
echo "Size: $(du -sh ${LOCAL_MIRROR_DIR} | cut -f1)"
