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
# Star Schema Design
 In this project, A star schema is implemented to optimize our data warehouse for efficient querying and reporting. The star schema consists of a central fact table (Sales) surrounded by dimension tables (Product, Customer, Territory and Date) .
 The star schema design allows for simplified and efficient queries, as the fact table is directly linked to each dimension table through foreign keys. This structure supports robust and flexible reporting, enabling detailed analysis and insights into sales performance across different dimensions.
 
 ![Screenshot (111)](https://github.com/user-attachments/assets/5d7ca2b3-63b7-4e49-a99d-e40509a409fc)
