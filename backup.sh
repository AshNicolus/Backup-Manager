#!/bin/bash


if [[ $# != 2 ]]; then
  echo "Usage: backup.sh target_directory_name destination_directory_name"
  exit 1
fi

if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "Invalid directory path provided"
  exit 1
fi


targetDirectory=$1
destinationDirectory=$2


echo "The Target Directory: $targetDirectory"
echo "The Destination Directory: $destinationDirectory"

currentTS=$(date +%s)  


backupFileName="backup-${currentTS}.tar.gz"


origAbsPath=$(pwd)


cd "$destinationDirectory" || exit
destDirAbsPath=$(pwd)


cd "$origAbsPath" || exit
cd "$targetDirectory" || exit

yesterdayTS=$(date -d "yesterday" +%s)  

declare -a toBackup


for file in $(find . -type f); do
  file_last_modified_date=$(date -r "$file" +%s)

 
  if (( file_last_modified_date > yesterdayTS )); then
    toBackup+=("$file")
  fi
done


if [[ ${#toBackup[@]} -gt 0 ]]; then
  tar -czf "$backupFileName" "${toBackup[@]}"
  echo "Backup created: $backupFileName"
else
  echo "No files modified in the last 24 hours. No backup created."
fi


mv "$backupFileName" "$destDirAbsPath"
echo "Backup moved to: $destinationDirectory"
