# Crowdfunding_ETL

# Files
-The coding files can be found labeled "ETL_Mini_Project_LGraves_APohle_BThomas_CMcMahill_JMaranto.ipynb".
-The csv files are in a folder labeled "Resources". There are four csv files that were output as a result of our code: "campaign.csv", "category.csv", "contacts.csv", and "subcategory.csv"
-The data set excel starter files are labeled "contacts.xlsx" and "crowdfunding.xlsx". 
-The database schema is saved as a Postgres file labeled "crowdfunding_db_schema.sql".
-The ERD is labeled as "crowdfunding_database_ERD". 

# Background
Practice building an ETL pipeline using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data. After we transformed the data, we created four CSV files and used the CSV file data to create an ERD and a table schema. Finally, we uploaded the CSV file data into a Postgres database.

# Data Used:
In the "Resources" folder there are two excel files labeled "contacts" and "crowdfunding". The data manipulation in our jupyter notebook was performed based on the data pulled from these files. In addition, we were provided with a starter code that listed the instructions for each part of the mini ETL project.

# Project Instructions
-Create the Category and Subcategory DataFrames
-Create the Campaign DataFrame
-Create the Contacts DataFrame
-Create the Crowdfunding Database

# Category and SubCategory DataFrames

First we assigned the category and subcategory values to category and subcategory columns.
Then we got the unique categories and subcategories into separate lists and got the number of distinct values in those lists. There are 9 categories and 24 subcategories.
After creating numpy arrays for categories (1-9) and subcategories (1-24), we used a list comprehension to add "cat" to each category_id and add "subcat" to each subcategory_id.
Finally, we created both category and subcategory dataframes with category_id array/subcategory_id array as the category_id/subcategory_id and category/subcategory lists as the category name/subcategory name. 

Here are the results: 
![image](https://github.com/user-attachments/assets/db6f493e-6086-4afc-8508-a67bbcda816d)


Category DataFrame- saved to the "Resources" folder as "category.csv".


![image](https://github.com/user-attachments/assets/aab94212-cce9-4c5e-b574-8255d90c931e)


Subcategory DataFrame- saved to the "Resources" folder as "subcategory.csv".


# Create the Campaign DataFrame
We started by creating a copy of the crowdfunding_info_df to create a campaign dataframe.
Next, we renamed the blurb, launched_at, and deadline columns to "description", "launch_date", and "end_date".
The goal and pleged columns were then coverted to a "float" data type. The launched_date and end_date columns were then changed from int64 datatypes to datetime format.
We then merged the campaign dataframe with the category datagrame on the "category" column and the subcategory dataframe on the "subcategory" column. 
Finally, we dropped any unwanted columns (staff_pick, spotlight, category & sub-category, category, subcategory).

Here are the results:
![image](https://github.com/user-attachments/assets/fbab3498-7b22-4388-9a97-34d3ae339f32)


Campaign DataFrame- saved to the "Resources" folder as "campaign.csv".


# Create the Contacts DataFrame
Option 1: Use Pandas to create the contacts dataframe. We opted to do option 1 for this portion. 
We started by iterating through the contact_info dataframe and converted each row to a dictionary. The data was in JSON format so we alterted this by using JSON.loads to convert it to python formatting. 
A new dataframe was created to add each list of values and each row to the columns "contact_id", "name", and "email".
The "name" column values were then split into two columns, "first_name" and "last_name". The original "name" column was then dropped. 
Finally the data was reorganized by column to list "contact_id", "first_name", "last_name", and "email". 

Here are the results: 
![image](https://github.com/user-attachments/assets/f7672631-9a17-49e0-a3a9-bd7d757abdc0)


Contacts Dataframe- saved to the "Resources" folder and labeled "contacts.csv".


# Create the Crowdfunding Database
We inspected the four CSV files and sketched an ERD of the tables by using QuickDBD. 

Here is the ERD:
![image](https://github.com/user-attachments/assets/e4435ad3-c7af-4851-b1d4-d688146b7c4e)


We then used the database schema to create the tables in the correct order to handle our designated foreign keys. 
We verified the table creation by running a SELECT statement for each table. 
Then we imported each CSV file into its corresponding SQL table. 
Finally, we verified that each table has the correct data by running a SELECT statement for each. 

The database schema is saved as a Postgres file labeled "crowdfunding_db_schema.sql".

# Notable Sources
https://www.quickdatabasediagrams.com/ to create the ERD.
https://numpy.org/doc/stable/reference/generated/numpy.arange.html documentation to view NumPy array examples.
https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.merge.html for more information on how to add the "category_id" and "subcategory_id" unique identification numbers to the campaign dataframe. 

# Contributions
This project was a collaborative effort of the following individuals: Andrew Pohle, Bryan Thomas, Caitlin McMahill, Jessica Maranto, and Lauren Graves. 
The code files labeled "ETL_Mini_Project_LGraves_APohle_BThomas_CMcMahill_JMaranto.ipynb" were written as a collaboration amongst this group. 
