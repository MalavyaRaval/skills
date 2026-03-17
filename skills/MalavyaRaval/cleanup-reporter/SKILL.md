# cleanup-reporter

A high-performance utility to reclaim disk space by identifying large directories, duplicate files, and stale resume files.

## Description
\`cleanup-reporter\` automates the identification of disk bloat. It provides a non-destructive scan that highlights high-impact opportunities for space reclamation without requiring risky, immediate deletions.

## Installation
\`\`\`bash
# Install via npm
npm install -g cleanup-reporter
\`\`\`

## Usage
Run a standard scan on your target directory:
\`\`\`bash
cleanup-reporter --scan /path/to/target
\`\`\`

### Options
- \`--scan <path>\`: Specifies the directory to analyze.
- \`--type <type>\`: Filter by file type (e.g., \`duplicate\`, \`large\`, \`stale\`).
- \`--dry-run\`: Performs a scan without initiating any deletion processes.

## Safety & Security
- **Safe Deletion:** This tool defaults to a "report-only" mode.
- **Trash Protocol:** When enabled, deletion uses the system's \`trash\` protocol (moving files to the trash bin) rather than permanent \`rm\` operations to prevent accidental data loss.
- **Audit Trails:** Every scan generates a lightweight log in \`~/.cleanup-reporter/logs/\` for transparency and auditability.

## Author
Malavya Raval (malavyaraval@gmail.com)
