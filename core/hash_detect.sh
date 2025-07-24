#!/bin/bash
# Advanced hash detection (length + regex for common patterns)

detect_hash_type() {
    local hash="$1"
    if [[ $hash =~ ^\$2[aby]\$ ]]; then
        echo "bcrypt"
    elif [[ $hash =~ ^\$argon2[aip]*\$ ]]; then
        echo "argon2"
    elif [[ $hash =~ ^\$6\$ ]]; then
        echo "sha512crypt"
    else
        case ${#hash} in
            32)
                [[ "$hash" =~ ^[a-fA-F0-9]{32}$ ]] && echo "md5" || echo "unknown"
                ;;
            40)
                [[ "$hash" =~ ^[a-fA-F0-9]{40}$ ]] && echo "sha1" || echo "unknown"
                ;;
            64)
                [[ "$hash" =~ ^[a-fA-F0-9]{64}$ ]] && echo "sha256" || echo "unknown"
                ;;
            128)
                [[ "$hash" =~ ^[a-fA-F0-9]{128}$ ]] && echo "sha512" || echo "unknown"
                ;;
            60)
                [[ "$hash" =~ ^\$2[aby]\$[0-9]{2}\$[./A-Za-z0-9]{53}$ ]] && echo "bcrypt" || echo "unknown"
                ;;
            *)
                echo "unknown"
                ;;
        esac
    fi
}

