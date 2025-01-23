# CyberHash - Advanced Hash Cracking Tool

**CyberHash** is a powerful shell scripting tool designed to crack password hashes using a wordlist. The script automatically detects the hash type (MD5, SHA-1, SHA-256, or SHA-512) and attempts to match the hash with a password from the wordlist.

---

## Features
- **Automatic Hash Detection**: Identifies the hash type based on length and pattern.
- **Supported Hash Types**:
  - MD5
  - SHA-1
  - SHA-256
  - SHA-512
- **Custom Wordlist Support**: Allows users to provide their own wordlist file.
- **Extensible Design**: Can be expanded to support additional hash types or features.

---

## **Usage**

### **1. Clone the Repository**
First, clone the CyberHash repository to your local machine:
```bash
git clone https://github.com/CyberGuard-Anil/cyberhash.git
cd cyberhash  
```
### Prerequisites
- **Shell Environment**: Tested on Linux and macOS.
- **Hash Utilities**: Ensure the following utilities are installed:
  - `md5sum`
  - `sha1sum`
  - `sha256sum`
  - `sha512sum`
To install these utilities on Ubuntu:
```bash
sudo apt-get install coreutils





