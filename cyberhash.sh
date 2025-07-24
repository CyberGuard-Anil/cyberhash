#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/core/utils.sh"

parse_args "$@"

# Check existence of wordlist
if [ ! -f "$WORDLIST" ]; then
    log_error "Wordlist file not found!"
    exit 1
fi

# Detect hash type
source "$SCRIPT_DIR/core/hash_detect.sh"
HASH_TYPE=$(detect_hash_type "$HASH_TO_CRACK")
log_info "Detected Hash Type: $HASH_TYPE"

case "$HASH_TYPE" in
    bcrypt)
        source "$SCRIPT_DIR/plugins/hash_bcrypt.sh"
        crack_bcrypt "$HASH_TO_CRACK" "$WORDLIST"
        ;;
    *)
        source "$SCRIPT_DIR/core/crack_engine.sh"
        crack_hash "$HASH_TO_CRACK" "$WORDLIST"
        ;;
esac

