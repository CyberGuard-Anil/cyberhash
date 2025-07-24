```markdown
# 🔐 CyberHash – Modular Automated Hash Cracker (Bash Edition)

> **Educational, modular, and extensible password hash cracker** for Linux/macOS written entirely in Bash.

![Bash](https://img.shields.io/badge/Bash-Advanced-blue?style=for-the-badge)
![Hash](https://img.shields.io/badge/Hash%20Types-Multi-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Active-brightgreen?style=for-the-badge)

---

## 📁 Project Structure

```

cyberhash/
├── core/
│   ├── crack\_engine.sh
│   ├── hash\_detect.sh
│   └── utils.sh
├── plugins/
│   └── hash\_bcrypt.sh
├── wordlists/
│   └── rockyou.txt (not included, see below)
├── results/
│   └── logs.txt
├── cyberhash.sh
├── LICENSE
└── README.md

````

---

## ⚙️ Features

- 🧠 Automatic hash type detection (length + regex pattern-based)
- 🔌 Plugin-based architecture (easily add new hash types)
- 🔐 Supports: MD5, SHA-1, SHA-256, SHA-512, **bcrypt** (via plugin)
- 📄 Custom wordlist support
- 🔄 Fully modular & maintainable
- 💻 Compatible with Linux and macOS

---

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/CyberGuard-Anil/cyberhash.git
cd cyberhash
chmod +x cyberhash.sh core/*.sh plugins/*.sh
````

### 2. Download a wordlist

We recommend `rockyou.txt`:

```bash
mkdir -p wordlists
wget -O wordlists/rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
```

### 3. Run the cracker

```bash
./cyberhash.sh -h <hash_value> -w wordlists/rockyou.txt
```

**Example (MD5 of "hello"):**

```bash
./cyberhash.sh -h 5d41402abc4b2a76b9719d911017c592 -w wordlists/rockyou.txt
```

---

## 🔧 Prerequisites

* **Bash** (version 4 or higher)
* Core hash utilities: `md5sum`, `sha1sum`, `sha256sum`, `sha512sum`
* For **bcrypt**:

  ```bash
  pip install bcrypt
  ```

---

## 📚 Usage

```bash
./cyberhash.sh -h <hash_value> -w <wordlist_path>
```

### Flags:

* `-h` → Hash value to crack
* `-w` → Path to the wordlist file

### Supported Hashes:

* `md5`
* `sha1`
* `sha256`
* `sha512`
* `bcrypt` (via plugin)

---

## 🧩 Adding New Hash Plugins

Want to add a new hash type (e.g., Argon2, NTLM)?

* Create a new file in `plugins/` like `hash_argon2.sh`
* Update `core/hash_detect.sh` to detect the new hash pattern

A stub/example is provided to get started quickly.

---

## 📝 Logging

Results and cracked passwords are stored in:

```bash
results/logs.txt
```

Or feel free to redirect output manually as per your needs.

---

## 🚫 About Wordlists

Due to GitHub file size policies, `rockyou.txt` is **not included**.

📥 You can manually download it here:
[Download rockyou.txt](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)

Or use your own custom wordlist!

---

## 🛡️ Legal & Ethical Notice

> This tool is meant **strictly for educational purposes** and authorized testing.
> **Never use against systems or networks without proper permission.**
> Misuse of this tool is your responsibility.

---

## 👨‍💻 Author

Made with ❤️ by [Cyber Guard x Anil Yadav](https://github.com/CyberGuard-Anil)

---

## ✨ Contributions Welcome!

Want to add a new hash type, improve performance, or make it prettier?

→ Fork, add changes, and send a Pull Request! 💡

```

