# Automation-Project
# 🏭 BlueScope Production Report Automation

This project was developed during my internship at **Tata BlueScope Steel** to automate the generation and display of coil production reports. The system uses **ASP.NET Web Forms** and connects to an **Oracle database (TOAD)** to provide real-time, filterable data for internal teams.

---

## 📌 Objective

To eliminate manual Excel reporting by building a secure, dynamic web application that displays real-time production data based on user-defined filters such as date, coil type, and production ID.

---

## ✅ Features

- 🔐 **Login Authentication**: Secure access for authorized users
- 🔄 **Real-time Data Fetching**: Connects to Oracle DB (`SYSTEM.CCLDATA`)
- 📆 **Date & Type Filtering**: Dropdowns and checkboxes for selecting data range and coil attributes
- 📊 **GridView Reporting**: Sortable and scrollable report table
- 🙋‍♂️ **Welcome Message**: Displays `Welcome EMP_NAME` using data from `T_USER_MASTER_RPT`
- 🔚 **Sign-Out Button**: Ends session and redirects to login
- 💻 **Responsive Layout**: Panels (`pnl_head`, `pnl_data`) with margins for a clean UI

---

## 🛠 Tech Stack

- **Frontend**: ASP.NET Web Forms, HTML, CSS  
- **Backend**: C# (.NET Framework), ADO.NET  
- **Database**: Oracle (via TOAD)  
- **Tools**: Visual Studio, TOAD for Oracle

---

## 📊 Impact

- ⏱ Reduced manual reporting time by over **60%**
- 📈 Improved data accuracy and visibility
- 👨‍💼 Enhanced internal workflow efficiency

---

