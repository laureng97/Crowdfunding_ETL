CREATE TABLE "Campaign" (
    "cf_id" INT NOT NULL,
    "contact_id" INT NOT NULL,
    "company_name" VARCHAR(200) NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "goal" FLOAT NOT NULL,
    "pledged" FLOAT NOT NULL,
    "outcome" VARCHAR(20) NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(2) NOT NULL,
    "currency" VARCHAR(10) NOT NULL,
    "launched_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "category_id" VARCHAR(10) NOT NULL,
    "subcategory_id" VARCHAR(15) NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY ("cf_id"),
    CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id") REFERENCES "Contacts" ("contact_id"),
    CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id") REFERENCES "Category" ("category_id"),
    CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id") REFERENCES "Subcategory" ("subcategory_id")
);

CREATE TABLE "Category" (
    "category_id" VARCHAR(10) NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY ("category_id")
);

CREATE TABLE "Contacts" (
    "contact_id" INT NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY ("contact_id")
);

CREATE TABLE "Subcategory" (
    "subcategory_id" VARCHAR(15) NOT NULL,
    "subcategory" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY ("subcategory_id")
);

-- Import CSV data into the tables
-- Adjust the file paths as necessary
COPY "Campaign" FROM 'Resources/campaign_data.csv' DELIMITER ',' CSV HEADER;
COPY "Category" FROM 'Resources/to/category_data.csv' DELIMITER ',' CSV HEADER;
COPY "Contacts" FROM 'Resources/contacts_data.csv' DELIMITER ',' CSV HEADER;
COPY "Subcategory" FROM 'Resources/subcategory_data.csv' DELIMITER ',' CSV HEADER;

-- Display data from each table
SELECT * FROM "Campaign";
SELECT * FROM "Category";
SELECT * FROM "Contacts";
SELECT * FROM "Subcategory";