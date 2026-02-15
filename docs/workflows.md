# GitHub Actions Workflows

This document describes the GitHub Actions workflows used in the Slackware Extended project.

## Workflows Overview

### 1. Sync Slackware Mirror (`sync-mirror.yml`)

**Purpose**: Automatically sync the Slackware-current mirror with official sources.

**Trigger**:
- Schedule: Daily at 2 AM UTC
- Manual: Via workflow_dispatch

**Steps**:
1. Install rsync and wget
2. Sync Slackware-current packages
3. Add extra packages (sbotools, slackpkg+)
4. Generate mirror statistics
5. Upload mirror status artifacts

**Artifacts**:
- `mirror-stats.txt` - Mirror size and package count
- `MIRROR_STATUS.txt` - Sync status and metadata

### 2. Build Slackware ISO (`build-iso.yml`)

**Purpose**: Create bootable Slackware Extended ISO images.

**Trigger**:
- Schedule: Weekly on Sundays at 3 AM UTC
- Manual: Via workflow_dispatch (with custom ISO name)

**Steps**:
1. Free up disk space
2. Install ISO creation tools
3. Sync minimal mirror for ISO
4. Download Slackware installer files
5. Add extra packages
6. Create ISO structure
7. Generate ISO image
8. Create checksums (MD5, SHA256)
9. Upload ISO as artifact
10. Create GitHub release

**Outputs**:
- ISO image file
- MD5 checksum
- SHA256 checksum
- GitHub release with download links

## Manual Workflow Triggers

### Triggering Mirror Sync

```bash
# Via GitHub CLI
gh workflow run sync-mirror.yml

# Via GitHub UI
# Go to Actions > Sync Slackware Mirror > Run workflow
```

### Triggering ISO Build

```bash
# Via GitHub CLI with custom name
gh workflow run build-iso.yml -f iso_name=slackware-extended-custom

# Via GitHub UI
# Go to Actions > Build Slackware ISO > Run workflow
# Enter custom ISO name (optional)
```

## Workflow Permissions

Required permissions:
- `contents: write` - For creating releases
- `actions: read` - For accessing artifacts

## Secrets Configuration

Optional secrets for enhanced functionality:

### Archive.org Publishing (Future Enhancement)
- `ARCHIVE_ORG_ACCESS_KEY` - Archive.org access key
- `ARCHIVE_ORG_SECRET_KEY` - Archive.org secret key

## Workflow Artifacts

### Mirror Sync Artifacts
- **Retention**: 30 days
- **Files**: mirror-stats.txt, MIRROR_STATUS.txt

### ISO Build Artifacts
- **Retention**: 30 days (artifacts), Permanent (releases)
- **Files**: *.iso, *.iso.md5, *.iso.sha256

## Workflow Monitoring

### Checking Workflow Status

```bash
# List recent workflow runs
gh run list --workflow=sync-mirror.yml

# View specific run
gh run view <run-id>

# Download artifacts
gh run download <run-id>
```

### Email Notifications

GitHub will send email notifications for:
- Failed workflow runs
- Successful scheduled builds

## Troubleshooting

### Workflow Failures

Common issues and solutions:

**Out of Disk Space**:
- The build-iso workflow includes cleanup steps
- If still failing, reduce mirror sync scope

**Network Timeout**:
- Mirror sync has fallback mirrors
- Workflow will retry with alternative sources

**Package Download Failures**:
- Check package URLs are still valid
- Update versions in scripts if needed

## Workflow Customization

### Changing Sync Schedule

Edit `.github/workflows/sync-mirror.yml`:
```yaml
on:
  schedule:
    - cron: '0 2 * * *'  # Daily at 2 AM UTC
```

### Changing ISO Build Schedule

Edit `.github/workflows/build-iso.yml`:
```yaml
on:
  schedule:
    - cron: '0 3 * * 0'  # Weekly on Sundays at 3 AM UTC
```

### Adding More Steps

Add custom steps to workflows:
```yaml
- name: Custom Step
  run: |
    echo "Custom action"
    bash scripts/custom-script.sh
```

## Related Documentation

- [Mirror Setup Guide](./mirror-setup.md)
- [ISO Creation Guide](./iso-creation.md)
