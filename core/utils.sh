#!/bin/bash
# Utility functions: argument parsing, OS check, logging

select_hash_command() {
    local type="$1"
    case "$type" in
        md5)
            command -v md5sum &>/dev/null && HASH_COMMAND="md5sum" || HASH_COMMAND="md5"
            ;;
        sha1)
            command -v sha1sum &>/dev/null && HASH_COMMAND="sha1sum" || HASH_COMMAND="shasum -a 1"
            ;;
        sha256)
            command -v sha256sum &>/dev/null && HASH_COMMAND="sha256sum" || HASH_COMMAND="shasum -a 256"
            ;;
        sha512)
            command -v sha512sum &>/dev/null && HASH_COMMAND="sha512sum" || HASH_COMMAND="shasum -a 512"
            ;;
        *)
            echo "Unsupported hash type!"
            exit 1
            ;;
    esac
}

log_success() { echo -e "\e[32m[✔]\e[0m $1"; }
log_error()   { echo -e "\e[31m[✖]\e[0m $1"; }
log_info()    { echo -e "\e[34m[i]\e[0m $1"; }

parse_args() {
    while getopts "h:w:" opt; do
        case $opt in
            h) HASH_TO_CRACK=$OPTARG ;;
            w) WORDLIST=$OPTARG ;;
            *) echo "Usage: $0 -h <hash> -w <wordlist>"; exit 1 ;;
        esac
    done
    if [ -z "$HASH_TO_CRACK" ] || [ -z "$WORDLIST" ]; then
        echo "Usage: $0 -h <hash> -w <wordlist>"
        exit 1
    fi
}


