# Sales Data Mart ETL Using SSIS
 This project involves creating a star schema for sales data using Microsoft SQL Server and implementing an ETL (Extract, Transform, Load) process with SQL Server Integration Services (SSIS). The data is sourced from the AdventureWorks dataset, cleansed, transformed, and loaded into the star schema for optimized querying and analysis.

# Key Features:
 * Star Schema Design: Designed and implemented a star schema for sales data in SQL Server, optimizing for query performance and data analysis.
 * ETL with SSIS: Utilized SSIS to extract data from the AdventureWorks dataset, cleanse and transform the data, and load it into the star schema.
 * Data Cleansing: Ensured data quality by handling missing values, correcting data types, and standardizing formats.
 * Data Transformation: Applied business logic to transform raw data into meaningful insights.

# Technologies Used:
 * AdventureWorks Dataset
 * Microsoft SQL Server
 * SQL Server Integration Services (SSIS)
 * SCD (Type 1 & Type 2)

# Project Workflow:
# 1. Star Schema Design
 In this project, A star schema is implemented to optimize our data warehouse for efficient querying and reporting. The star schema consists of a central fact table (Sales) surrounded by dimension tables (Product, Customer, Territory and Date) .
 The star schema design allows for simplified and efficient queries, as the fact table is directly linked to each dimension table through foreign keys. This structure supports robust and flexible reporting, enabling detailed analysis and insights into sales performance across different dimensions.
 
 ![Screenshot (111)](https://github.com/user-attachments/assets/5d7ca2b3-63b7-4e49-a99d-e40509a409fc)

 # 2. SSIS Packages
  Data Mart was built using these Packages.
  
![Screenshot (132)](https://github.com/user-attachments/assets/7153be76-4769-4c42-91cd-ea6dc30a9980)

# 3. Dimension Load Processes and Fact Table Load Processes
  * Initial Load : This process involves extracting all relevant data from source system (AdventureWorks), transforming it to it dimensional schema, and loading it to the the dimension table.
  * 
![Screenshot (122)](https://github.com/user-attachments/assets/ecb501a0-3830-41bb-9feb-69a7d692d701)

![Screenshot (121)](https://github.com/user-attachments/assets/6f46c678-6f1e-426e-8e49-bff12350c6e9)

![Screenshot (116)](https://github.com/user-attachments/assets/960e4742-3e85-46f0-97c5-85c1c12bfa21)
![Screenshot (117)](https://github.com/user-attachments/assets/47e7c479-21f6-4225-ae57-1f86e4eb63a1)

![Screenshot (124)](https://github.com/user-attachments/assets/8329588e-dbd5-4d19-b69f-2d462ea92648)
![Screenshot (125)](https://github.com/user-attachments/assets/1bde8b61-bc1b-40b6-a238-e175263763a0)

