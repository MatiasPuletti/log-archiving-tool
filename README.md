# Log Archiving Tool

A minimalist command-line tool for archiving logs in a compressed format. This tool is designed to help keep your system clean by compressing and organizing logs on a scheduled basis. It supports logging each archive session with details such as date, source directory, archive size, and completion status.

> **✨ Inspiration**: This project is inspired by [Log Archive Project on roadmap.sh](https://roadmap.sh/projects/log-archive-tool)

## Features
- **Customizable Log Directory**: Accepts any directory path containing logs as an argument.
- **Compression and Organization**: Compresses logs into a `.tar.gz` file and stores it in an organized archive folder within the specified log directory.
- **Detailed Logging**: Logs each archive session with the following details:
  - Date and Time
  - Source Directory
  - Destination (where the compressed file is stored)
  - Archive Size
  - Status (Success or Failure)
  
- **Clear Visual Markers**: ✅ for success and ❌ for failure, making logs easy to scan.

## Usage
1. **Make the script executable**:
   ```bash
   chmod +x log-archive.sh
