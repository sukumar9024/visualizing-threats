# 🚀 CyberLens - Securing Logs, Detecting Threats!

CyberLens is a web-based tool designed to analyze log files for security threats using AI-driven threat detection. It provides insights through visual reports and detailed threat breakdowns.

## 📌 Features
✅ Log file analysis for security threats
✅ AI-based detection of Brute Force, DDoS, SQL Injection, XSS, and more
✅ Interactive dashboard with visual graphs
✅ JSON-based reports for further analysis
✅ Secure authentication system

## 🔧 Setup & Installation

### 1️⃣ Setup MySQL Database

#### Start MySQL Server (via XAMPP)

Import the database:
```sql
CREATE DATABASE cyberLens;
USE cyberLens;
SOURCE database/cyberlens.sql;
```

### 2️⃣ Configure Environment
Edit `config.php` and update database credentials.

### 3️⃣ Start the Server
Move the project folder to the `htdocs` directory (XAMPP).
Start Apache & MySQL in XAMPP.
Access it in your browser:
```
http://localhost/CyberLens
```

## 📊 How It Works?
1. **Login/Register**
2. **Upload a Log File (.log, .txt)**
3. **System Analyzes Threats (via Python)**
4. **Dashboard Displays Results**
5. **Download Report & View Graphs 📈**

## 📁 Folder Structure
```bash
CyberLens/
│── uploads/               # Log file uploads
│── reports/               # JSON reports generated
│── css/                   # Stylesheets
│── python-scripts/        # Python threat analysis scripts
│── config.php             # Database configuration
│── dashboard.php          # Main dashboard
│── login.php              # User authentication
│── register.php           # User registration
│── analyze_logs.py        # Python script for log parsing
│── README.md              # Project documentation
```

## 🎯 Future Enhancements
✅ Improve AI-Based Threat Detection
✅ Automate Report Emailing
✅ Add Multi-User Role Management

## 🤝 Contributing
Want to improve CyberLens?

1. **Fork the repository**
2. **Create a feature branch**
```bash
git checkout -b feature-branch
```
3. **Commit your changes**
```bash
git commit -m "Added a new feature"
```
4. **Push to your fork and create a Pull Request**

## 🛡️ Security Considerations
- Ensure PHP session management is secure.
- Validate all file uploads to prevent malicious scripts.
- Use prepared statements for SQL queries.

## 📜 License
MIT License © 2024 CyberLens

## 📩 Contact & Support
For any queries or issues, open a GitHub Issue or contact me at:
📧 sukumarchintham866@gmail.com
🔗 [GitHub Profile](https://github.com/sukumar9024)

---

🚀 **CyberLens - Your AI-Powered Threat Analysis Assistant!** 🔥
