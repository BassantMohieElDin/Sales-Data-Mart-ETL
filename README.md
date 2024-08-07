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
  
  ![Screenshot (133)](https://github.com/user-attachments/assets/09d610e4-8254-489f-9bba-e7287a31575b)

# 3. Dimensions Load Processes 
  * Initial Load : This process involves extracting all relevant data from source system (AdventureWorks), transforming it to it dimensional schema, and loading it to the the dimension table.
    * Territory Dimension:
            In the source System, the (Country Region Code) is a two-letter code representing the country or region, so (lookup country) table was created to map the country region codes to their full country   name during data transformation.
    
      ![Screenshot (122)](https://github.com/user-attachments/assets/ecb501a0-3830-41bb-9feb-69a7d692d701)
     *  Date Dimension:
            Date data is extracted from excel sheet, then data conversion was applied to the (full date) attribute to match the type of column (full date) in the destination.
      ![Screenshot (121)](https://github.com/user-attachments/assets/6f46c678-6f1e-426e-8e49-bff12350c6e9)
    *  Product Dimension:
          Here,  there's SCD.Regarding attribute (Reorder Point), we want to keep the last value and mark it as outdated and insert new record that is the current reorder point (Type 2).And regarding all the other attributes, we want to overwrite the existing values with the new values (Type 1).
      ![Screenshot (116)](https://github.com/user-attachments/assets/960e4742-3e85-46f0-97c5-85c1c12bfa21)
      ![Screenshot (117)](https://github.com/user-attachments/assets/47e7c479-21f6-4225-ae57-1f86e4eb63a1)
   *  Customer Dimension:
          Here,  there's SCD.Regarding attribute (Phone), we want to keep the last value and mark it as outdated and insert new record that is the current rorder point (Type 2).And regarding all the other attributes, we want to overwrite the existing values with the new values (Type 1).
      ![Screenshot (124)](https://github.com/user-attachments/assets/8329588e-dbd5-4d19-b69f-2d462ea92648)
      ![Screenshot (125)](https://github.com/user-attachments/assets/1bde8b61-bc1b-40b6-a238-e175263763a0) 
* Product and Customer Dimensions after changes:

  ![Screenshot (126)](https://github.com/user-attachments/assets/b40d10b9-47e9-4c48-a05b-c3dab2cb50f8)

  ![Screenshot (119)](https://github.com/user-attachments/assets/673bb145-42af-44c0-9c16-3bdb178e0a16)
# 4. Fact Full and Incremental Load


