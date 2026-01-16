# Git Author Migration

A shell script to migrate git commit author information across multiple repositories.

## Overview

This tool helps rewrite git history to update author email/name across multiple repositories. Useful when you need to consolidate commit authorship after email changes.

## Usage

1. Edit `repos.txt` with your repository names (one per line)
2. Set environment variables:
   ```bash
   export GITHUB_USER="your_username"
   export GITHUB_TOKEN="your_token"
   ```
3. Run the migration:
   ```bash
   ./migrate.sh
   ```

## Files

- `migrate.sh` - Main migration script
- `repos.txt` - List of repositories to process

## ⚠️ Warning

This script uses `git filter-branch` which rewrites history. Always backup your repositories before running.

## Author

Jak Akdemir
