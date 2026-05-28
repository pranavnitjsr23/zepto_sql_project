#Zepto Inventory Analysis — SQL Project
An end-to-end SQL analysis of Zepto's e-commerce product inventory, built to simulate real-world Business Analyst work: cleaning raw data, exploring it, and surfacing actionable business insights.

Tool: MySQL Workbench | Dataset: Kaggle (scraped from Zepto's live listings)

🔍 What This Project Covers
PhaseDetailsDatabase SetupCreated and loaded the inventory table in MySQLData CleaningRemoved invalid prices, converted paise → ₹, handled nulls, EDA, Explored categories, stock status, pricing distribution, Business Insights, Discount analysis, revenue by category, out-of-stock gaps, price-per-gram

📊 Key Business Questions Answered

Which products offer the highest discount value?
Which categories have the most revenue potential?
Where are the out-of-stock gaps in high-demand categories?
How do products compare on a price-per-gram basis?


 Dataset Columns
sku_id · name · category · mrp · discountPercent · discountedSellingPrice · availableQuantity · weightInGms · outOfStock · quantity

 Files
https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv

 How to Run

Open MySQL Workbench and create a new schema
Run zepto_analysis.sql to create the table and import data
Execute queries section by section to follow the analysis
