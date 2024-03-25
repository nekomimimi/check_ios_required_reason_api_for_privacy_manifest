#!/bin/bash
if [ "$#" -lt 1 ]; then
  echo "usage: $0 [-d] ios_binary_file_path"
  echo "-d: Set -d if the file is a dynamic linking shared library."
  exit 1
fi

FLAG=""
FILE=""

if [ "$1" == "-d" ]; then
  FLAG="-gU"
  if [ "$#" -ne 2 ]; then
    echo "usage: $0 [-d] ios_binary_file_path"
    exit 1
  fi
  FILE="$2"
else
  FILE="$1"
fi
echo
echo '* File timestamp APIs'
FILE_STAMP_API="NSFileCreationDate"
FILE_STAMP_API="${FILE_STAMP_API}|NSURLContentModificationDateKey"
FILE_STAMP_API="${FILE_STAMP_API}|fileModificationDate"
FILE_STAMP_API="${FILE_STAMP_API}|NSURLContentModificationDateKey"
FILE_STAMP_API="${FILE_STAMP_API}|NSURLCreationDateKey"
FILE_STAMP_API="${FILE_STAMP_API}|getattrlist"
FILE_STAMP_API="${FILE_STAMP_API}|getattrlistbulk"
FILE_STAMP_API="${FILE_STAMP_API}|fgetattrlist"
FILE_STAMP_API="${FILE_STAMP_API}|stat"
FILE_STAMP_API="${FILE_STAMP_API}|fstat"
FILE_STAMP_API="${FILE_STAMP_API}|fstatat"
FILE_STAMP_API="${FILE_STAMP_API}|lstat"
FILE_STAMP_API="${FILE_STAMP_API}|getattrlistat"
nm $FLAG "$FILE" | grep -E $FILE_STAMP_API

echo
echo '* System boot time APIs'
SYSTEM_BOOT_TIME_API="systemUptime|mach_absolute_time"
nm $FLAG "$FILE" | grep -E $SYSTEM_BOOT_TIME_API

echo
echo '* Disk space APIs'
DISK_SPACE_API="NSURLVolumeAvailableCapacityKey"
DISK_SPACE_API="${DISK_SPACE_API}|NSURLVolumeAvailableCapacityForImportantUsageKey"
DISK_SPACE_API="${DISK_SPACE_API}|NSURLVolumeAvailableCapacityForOpportunisticUsageKey"
DISK_SPACE_API="${DISK_SPACE_API}|NSURLVolumeTotalCapacityKey"
DISK_SPACE_API="${DISK_SPACE_API}|NSFileSystemFreeSize"
DISK_SPACE_API="${DISK_SPACE_API}|NSFileSystemSize"
DISK_SPACE_API="${DISK_SPACE_API}|statfs"
DISK_SPACE_API="${DISK_SPACE_API}|statvfs"
DISK_SPACE_API="${DISK_SPACE_API}|fstatfs"
DISK_SPACE_API="${DISK_SPACE_API}|fstatvfs"
DISK_SPACE_API="${DISK_SPACE_API}|getattrlist"
DISK_SPACE_API="${DISK_SPACE_API}|fgetattrlist"
DISK_SPACE_API="${DISK_SPACE_API}|getattrlistat"
nm $FLAG "$FILE" | grep -E $DISK_SPACE_API

echo
echo '* Active keyboard APIs'
ACTIVE_KEYBOARD_API="activeInputModes"
nm $FLAG "$FILE" | grep -E $ACTIVE_KEYBOARD_API

echo
echo '* User defaults APIs'
USER_DEFAULTS_API="NSUserDefaults"
nm $FLAG "$FILE" | grep -E $USER_DEFAULTS_API