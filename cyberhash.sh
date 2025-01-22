#!/bin/bash

# Advanced Password Cracker with Automatic Hash Type Detection

# Usage: ./password_cracker_auto_detect.sh <hash_to_crack> <wordlist_file>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <hash_to_crack> <wordlist_file>"
    exit 1
fi

HASH_TO_CRACK=$1
WORDLIST=$2

if [ ! -f "$WORDLIST" ]; then
    echo "Error: Wordlist file not found!"
    exit 1
fi

# Detect hash type based on hash length and pattern
detect_hash_type() {
    case ${#1} in
        32) echo "md5" ;;
        40) echo "sha1" ;;
        64) echo "sha256" ;;
        128) echo "sha512" ;;
        *)
            echo "unknown"
            ;;
    esac
}

HASH_TYPE=$(detect_hash_type "$HASH_TO_CRACK")

if [ "$HASH_TYPE" == "unknown" ]; then
    echo "Error: Unable to detect hash type. Unsupported or invalid hash format."
    exit 1
fi

# Assign the corresponding hashing command
case "$HASH_TYPE" in
    md5) HASH_COMMAND="md5sum" ;;
    sha1) HASH_COMMAND="sha1sum" ;;
    sha256) HASH_COMMAND="sha256sum" ;;
    sha512) HASH_COMMAND="sha512sum" ;;
    *)
        echo "Error: Unsupported hash type detected!"
        exit 1
        ;;
esac

echo "Detected Hash Type: $HASH_TYPE"
echo "Starting password cracking simulation..."
echo "Target Hash: $HASH_TO_CRACK"
echo "Wordlist: $WORDLIST"
echo ""

while IFS= read -r password; do
    # Hash the current word
    hash=$(echo -n "$password" | $HASH_COMMAND | awk '{print $1}')

    echo "Trying password: $password -> Hash: $hash"

    if [ "$hash" == "$HASH_TO_CRACK" ]; then
        echo ""
        echo "Password found: $password"
        exit 0
    fi
done < "$WORDLIST"

echo ""
echo "Password not found in wordlist."
exit 1
