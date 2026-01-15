#!/bin/bash

GRADLE_FILE="app/build.gradle"

if [ ! -f "$GRADLE_FILE" ]; then
    echo "Error: $GRADLE_FILE not found!"
    exit 1
fi

# Get current version code
OLD_CODE=$(grep "versionCode =" $GRADLE_FILE | awk '{print $3}')
NEW_CODE=$((OLD_CODE + 1))

# Get current version name (assuming 14.XXXX format)
OLD_NAME=$(grep "versionName =" $GRADLE_FILE | awk -F'"' '{print $2}')
BASE_NAME=$(echo $OLD_NAME | cut -d'.' -f1)
NEW_NAME="$BASE_NAME.$NEW_CODE"

# Update file
sed -i "s/versionCode = $OLD_CODE/versionCode = $NEW_CODE/" $GRADLE_FILE
sed -i "s/versionName = \"$OLD_NAME\"/versionName = \"$NEW_NAME\"/" $GRADLE_FILE

echo "Bumped version: $OLD_NAME -> $NEW_NAME (Code: $NEW_CODE)"

