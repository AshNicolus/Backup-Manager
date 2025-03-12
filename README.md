# Backup Script

This is a simple Bash script to back up files that were modified in the last 24 hours from a target directory to a destination directory.

## Usage

Run the script using the following command:

```bash
./backup.sh target_directory_name destination_directory_name
```

### Example:

```bash
./backup.sh /home/user/documents /home/user/backups
```

## How It Works

1. The script checks if exactly two arguments are provided (target and destination directories).
2. It verifies that both arguments are valid directory paths.
3. It calculates the current timestamp and creates a backup file name based on it.
4. It identifies files in the target directory that were modified in the last 24 hours.
5. If modified files exist, it compresses them into a `.tar.gz` archive.
6. The backup file is moved to the destination directory.

## Output

- If files have been modified in the last 24 hours, you will see:
  ```
  Backup created: backup-<timestamp>.tar.gz
  Backup moved to: destination_directory
  ```
- If no files were modified:
  ```
  No files modified in the last 24 hours. No backup created.
  ```
- If incorrect usage:
  ```
  Usage: backup.sh target_directory_name destination_directory_name
  ```
- If invalid directory paths are provided:
  ```
  Invalid directory path provided
  ```

## Requirements

- Linux/macOS with Bash
- `tar` installed

## Notes

- Ensure the script has execution permissions:
  ```bash
  chmod +x backup.sh
  ```
- Run the script with the correct directory paths.
- The backup file will be stored in the specified destination directory.

## Author

- Script by Ash Nicolus

## License

This script is open-source and can be modified as needed.