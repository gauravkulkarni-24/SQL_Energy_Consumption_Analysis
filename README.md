# 🌍 SQL Project: World Wide Energy Consumption Analysis  

## 📘 Overview  
This project focuses on analyzing **global energy production, consumption, emissions, and GDP data** using **SQL**. It demonstrates how relational databases can be transformed into meaningful insights about **energy trends, sustainability, and economic growth**.  

It is an important part of my **Data Science learning journey** after mastering Python and Excel, and it helped me explore how SQL can reveal real-world patterns hidden inside large datasets.  

---

## 🎯 Project Objective  
To study and understand how energy is produced, consumed, and emitted across different countries and years, and to identify the connection between **energy usage, GDP, population, and sustainability goals** for global development.  

---

## 🧱 Database Design  
**Database Name:** ENERGYDB2  

The database was built with six relational tables designed to handle large-scale data efficiently:  

- `country_3` – Stores country names and unique IDs  
- `emission_3` – Contains emission data by energy type, country, and year  
- `population_3` – Stores yearly population data for each country  
- `production_3` – Tracks energy production by source and country  
- `gdp_3` – Holds GDP data for each country and year  
- `consum_3` – Contains energy consumption values  

All CSV files used to populate these tables are provided in the **Data_Files** folder.  

---

## ⚙️ Setup and Data Import Guide  

**Step 1:** Create a new database named `ENERGYDB2`.  
**Step 2:** Run the table creation script located in `SQL_Files/Energy_Consumption_Analysis_Table_Structure.sql`.  
This will create all the necessary tables and relationships.  

**Step 3:** Import the data from the CSV files located in the `Data_Files` folder.  
You can use MySQL Workbench’s “Table Data Import Wizard” or run the standard `LOAD DATA INFILE` command for each file.  

**Step 4:** Once the data is successfully imported, execute the query file `SQL_Files/Energy_Consumption_Analysis_Query_Solution.sql` to perform complete data analysis and generate insights.  

---

## 🧩 Concepts and Tools Used  
- SQL fundamentals: DDL, DML, and DQL commands  
- Joins (Inner, Left), Subqueries, and Aggregation  
- Functions like SUM, AVG, COUNT, ROUND  
- Window functions such as LAG for year-over-year analysis  
- Data relationships through Foreign Keys  
- Ratio, per capita, and trend analysis  
- Database normalization and data integrity handling  

---

## 📊 Insights and Results  
This project revealed how energy, economy, and environment are closely linked:  
- Countries like **China and the USA** lead in total energy emissions due to large industries and energy demand.  
- **Coal** remains the top emission contributor globally, while renewable sources show minimal impact.  
- Global emissions show a steady increase, except a slight dip in **2020**, likely due to pandemic-related restrictions.  
- **USA, China, Japan, Germany, and India** lead in GDP, highlighting a correlation between economic power and energy consumption.  
- Some nations, like **India and Japan**, consume more energy than they produce, reflecting high import dependency, while **Russia and the USA** maintain near self-sufficiency.  

---

## 📈 Project Presentation  
A detailed PowerPoint presentation has been included in the **Presentation** folder.  
It contains the ER diagram, visual charts, analytical findings, and major conclusions drawn from SQL-based insights.  

---

## 🧠 Learnings  
- Designed and managed a complete relational database system from scratch.  
- Strengthened understanding of **data relationships, joins, and query optimization**.  
- Learned to derive **business-level insights** from structured data.  
- Developed the ability to convert raw data into meaningful stories and trends.  
- Gained deeper awareness of how **energy usage impacts global sustainability**.  

---

## 📂 Folder Overview  
- **SQL_Files:** Database creation and analysis scripts  
- **Data_Files:** CSV files for country, GDP, production, consumption, population, and emission data  
- **Presentation:** PowerPoint file explaining visuals and results  

---

## 💻 Tech Stack  
- Database: MySQL  
- Tool: MySQL Workbench  
- Language: SQL  
- Visualization: Microsoft PowerPoint  

---

## 🚀 Future Scope  
- Integrate SQL data with Python (using Pandas and Matplotlib) for visual dashboards.  
- Automate report generation and insights using scripts.  
- Extend the dataset with live APIs for up-to-date energy analytics.  

---
