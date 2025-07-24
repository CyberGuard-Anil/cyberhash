#!/bin/bash
# Core logic: looping through wordlist and matching hashes

source "$(dirname "$0")/hash_detect.sh"
source "$(dirname "$0")/utils.sh"

crack_hash() {
    local target_hash="$1"
    local wordlist="$2"
    local hash_type
    hash_type=$(detect_hash_type "$target_hash")

    if [ "$hash_type" == "unknown" ]; then
        echo "Error: Unsupported or invalid hash format."
        exit 1
    fi

    select_hash_command "$hash_type"

    local found=0
    while IFS= read -r password || [ -n "$password" ]; do
        [ -z "$password" ] && continue
        local hash
        hash=$(echo -n "$password" | $HASH_COMMAND | awk '{print $1}')
        if [ "$hash" == "$target_hash" ]; then
            log_success "Password found: $password"
            found=1
            break
        fi
    done < "$wordlist"

    if [ "$found" -eq 0 ]; then
        log_error "Password not found in wordlist."
        exit 1
    fi
}

