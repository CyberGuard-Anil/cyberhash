# 🔐 CyberHash – Advanced Hash Cracking Tool (Bash Edition)

> 💣 Crack password hashes like a pro using Bash!  
CyberHash automatically detects the hash type and compares it with your wordlist — no manual guesswork required.

![bash](https://img.shields.io/badge/Bash-Script-blue?style=for-the-badge)
![hash](https://img.shields.io/badge/Hash%20Cracking-Automated-red?style=for-the-badge)
![status](https://img.shields.io/badge/Project-Active-brightgreen?style=for-the-badge)

---

## ⚙️ Features

- 🧠 **Automatic Hash Type Detection**  
- 🔐 Supports:  
  - MD5  
  - SHA-1  
  - SHA-256  
  - SHA-512  
- 📁 **Custom Wordlist Support**  
- 🔄 Extensible Script Design  
- 💻 Works on all major Linux/macOS systems

---

## 🖥️ Demo

```bash
$ ./cyberhash.sh -h fcea920f7412b5da7be0cf42b8c93759 -w wordlist.txt

[+] Detected Hash Type: MD5
[+] Cracking...
[✔] Hash matched! Password: password1
````

---

## 🚀 Installation

### 🔽 1. Clone the Repository

```bash
git clone https://github.com/CyberGuard-Anil/cyberhash.git
cd cyberhash
chmod +x cyberhash.sh
```

---

## 📦 Prerequisites

Ensure the following utilities are installed:

* `md5sum`
* `sha1sum`
* `sha256sum`
* `sha512sum`

### 📥 Install on Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install coreutils
```

---

## 🔧 Usage

```bash
./cyberhash.sh -h <hash_value> -w <wordlist.txt>
```

### 📌 Flags:

* `-h`: Hash string to crack
* `-w`: Path to the wordlist

### ✅ Example:

```bash
./cyberhash.sh -h 5d41402abc4b2a76b9719d911017c592 -w rockyou.txt
```

---

## 🧠 How It Works

1. Script checks hash length and pattern
2. Based on that, selects the hashing algorithm
3. Iterates through the wordlist
4. Hashes each word and compares with given hash
5. Displays password if matched, else shows "not found"

---

## 📁 File Structure

```
cyberhash/
├── cyberhash.sh
├── wordlist.txt (example)
└── README.md
```

---

## 📌 Sample Wordlist

Use your own or download popular ones like:

* `/usr/share/wordlists/rockyou.txt`
* `SecLists/Passwords`

---

## 💡 Educational Use Only

This script is built to teach:

* Hash cracking logic using Bash
* Conditional logic and looping
* Working with CLI arguments & file handling

Do NOT use it on unauthorized systems or data.

---

## ❓ Troubleshooting

**Command not found?**
Make sure you’ve given executable permission:

```bash
chmod +x cyberhash.sh
```

**Hash not detected?**
Check if the hash is supported (MD5/SHA-1/SHA-256/SHA-512)

**No match found?**
Try a larger or more relevant wordlist

---

## 👨‍💻 Author

Built with 🔐 by [Cyber Guard x Anil Yadav](https://github.com/CyberGuard-Anil)
Part of the **Cybersecurity Bash Automation Toolkit**

---

## 📜 License

MIT License — Open to use, learn, remix, and improve.

---

> 🧠 Crack Intelligently | 💻 Automate Bruteforce | 🔒 Stay Ethical
> **Happy Hacking, Stay Secure!**
