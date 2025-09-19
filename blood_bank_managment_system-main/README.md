INSTRUCTIONS AND GIT LINK: -
LINK- https://github.com/NamithaaKanumuru/blood_bank_managment_system
# Blood_Bank_Managment_System

This project contains the database structure and data for the Blood Bank Management System (BBMS). It includes DDL, DML, views, and user grants scripts necessary to create and populate tables, views, and other database components. The project follows a fully normalized schema and implements key business rules, validations, and constraints to ensure data integrity.

## Table of Contents
1. Prerequisites
2. Installation
3. User setup
4. Running DDL and DML Scripts
5. Views
6. Git Workflow
7. How and What to Run

---

### Prerequisites

To run this project, ensure you have the following:
- Oracle SQL or compatible database client
- Basic understanding of SQL and Git
- Access to this repository

---

### Installation

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/NamithaaKanumuru/blood_bank_managment_system

2. Make sure your database client is properly connected and authenticated to the database where these scripts will be run.

---

### User Setup

- Before running the DDL and DML scripts, you need to create a user account in your Oracle database and assign the necessary permissions to allow table creation, data insertion, and other required operations.

- Connect to your Oracle database as an admin user.

---

## Running DDL and DML Scripts

The project is organized into a series of scripts for defining (DDL) and manipulating (DML) data. Each section has a main script that coordinates all related operations.

### 1. DDL Scripts
Start by setting up the database structure using the main DDL script. This script will create all necessary tables, indexes, and other objects.

```sql
{path_to_repo_files}/blood_bank_managment_system\sqlQueries\sql_queries\ddl\create_tables\create_main.sql
```

- **Note**: We have handled the case of dropping the table if it already exists. The DDL script includes DROP statements to remove existing objects if necessary.
- **Note**: This package also includes individual creation scripts for tables if you need to create them separately.

### 2. Granting Roles and Permissions
Run the **grant.sql** script to create roles, define users, and assign permissions:

```sql
{path_to_repo_files}/blood_bank_managment_system\sqlQueries\sql_queries\grants\grant_access.sql
```

#### Roles and Permissions:
1. **bbms_admin_role** – Full access to all tables and views, allowing complete database control.
2. **bbms_donor_role** – Access to blood request management, patient records, and hospital operations.
3. **bbms_staff_role** – Limited access to view their donation history and update personal information.

### 3. DML Scripts
Once the database structure is in place, populate the tables using the main DML script.

```sql
{path_to_repo_files}/blood_bank_managment_system\sqlQueries\sql_queries\dml\insert_data\insert_main.sql
```

- **Note**: This script inserts initial data, including **sample donor records, hospital data, blood requests, and inventory details** for testing.
- **Note**: Individual data insertion scripts are also available for inserting records into specific tables separately.

---

## Views

Views are created separately after the DDL and DML steps are complete. To create the views, run:

```sql
{path_to_repo_files}/blood_bank_managment_system\sqlQueries\sql_queries\views\views_main.sql
```

- **Note**: This will create all required views, with individual view scripts also available.

---

## Git Workflow

### Git Access

You have read-only access to this repository, which means:
- You can clone the repository and make local modifications for testing and development.
- Any changes you make will be local and cannot be pushed back to the repository.

---

## How and What to Run

1. **Initialize Database Structure**: Run the main DDL script to create all tables and objects.
2. **Grant Access**: Run the grant access SQL file:
    ```sql
    /sqlQueries/sql_queries/grants/grant_access.sql
    ```
3. **Insert Sample Data**: Run the main DML script to populate tables.
4. **Create Views**: Finally, run the `views_main.sql` script to set up views.

---

## Files to Run

1. Run /sqlQueries/sql_queries/ddl/create_tables/create_main.sql

2. Run /sqlQueries/sql_queries/grants/grant_access.sql

3. Run /sqlQueries/sql_queries/dml/insert_data/insert_main.sql

4. Run /sqlQueries/sql_queries/views/views_main.sql




