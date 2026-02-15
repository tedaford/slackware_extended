# Contributing to Slackware Extended

Thank you for your interest in contributing to Slackware Extended! This document provides guidelines for contributing to the project.

## Ways to Contribute

### 1. Suggest Additional Packages

If you have suggestions for packages to include in the extended repository:

1. Open an issue with the package name
2. Provide a brief description of the package
3. Explain why it would benefit users
4. Include package source/download URL

### 2. Report Issues

If you encounter problems:

1. Check existing issues first
2. Open a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - System information (if relevant)

### 3. Improve Documentation

Documentation improvements are always welcome:

1. Fix typos or unclear instructions
2. Add examples or use cases
3. Improve formatting
4. Translate documentation

### 4. Enhance Scripts

Script improvements:

1. Optimize mirror sync performance
2. Add error handling
3. Improve logging
4. Add new features

### 5. GitHub Actions Workflows

Workflow enhancements:

1. Optimize build times
2. Add new automation
3. Improve artifact handling
4. Add notifications

## Development Process

### Setting Up Development Environment

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/slackware_extended.git
   cd slackware_extended
   ```
3. Create a branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Making Changes

1. Make your changes
2. Test your changes locally:
   ```bash
   bash scripts/sync-mirror.sh  # Test mirror sync
   bash scripts/add-extra-packages.sh  # Test package addition
   ```
3. Commit your changes:
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```
4. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request

### Pull Request Guidelines

- Provide a clear description of changes
- Reference related issues
- Keep changes focused and atomic
- Test before submitting
- Update documentation if needed

## Code Style

### Shell Scripts

- Use `#!/bin/bash` shebang
- Use `set -e` for error handling
- Add comments for complex logic
- Use meaningful variable names
- Follow existing formatting

### GitHub Actions

- Use clear step names
- Add comments for complex workflows
- Test workflows before merging
- Use official actions when available

### Documentation

- Use Markdown format
- Keep line length reasonable
- Use code blocks for commands
- Add examples where helpful

## Testing

### Local Testing

Before submitting changes:

1. Test scripts locally
2. Verify syntax with shellcheck:
   ```bash
   shellcheck scripts/*.sh
   ```
3. Test workflows in your fork
4. Check documentation renders correctly

### What to Test

- Mirror sync with different network conditions
- Package downloads with various versions
- ISO creation process
- Documentation clarity

## Commit Messages

Write clear commit messages:

```
Add support for custom mirror sources

- Allow users to specify custom mirror URLs
- Add configuration option to mirror-config.conf
- Update documentation with examples
```

Format:
- First line: Brief summary (50 chars or less)
- Blank line
- Detailed description (if needed)
- List specific changes

## Code Review Process

1. Maintainers will review your PR
2. Address any requested changes
3. Once approved, changes will be merged
4. Your contribution will be credited

## Community Guidelines

- Be respectful and constructive
- Help others when possible
- Follow the Code of Conduct
- Ask questions if unsure

## License

By contributing, you agree that your contributions will be licensed under the GPLv2 License.

## Questions?

If you have questions:

1. Check documentation first
2. Search existing issues
3. Open a new issue for questions
4. Join discussions

## Recognition

Contributors will be recognized in:
- Release notes
- GitHub contributors page
- Special thanks in documentation

Thank you for contributing to Slackware Extended!
