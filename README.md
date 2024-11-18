# DB_Assignment_3

## 📚 Database Normalization Project

---

### Table of Contents

- [Introduction](#introduction)
- [Data Overview](#data-overview)
- [Project Objectives](#project-objectives)
- [Normalization Process](#normalization-process)
  - [First Normal Form (1NF)](#first-normal-form-1nf)
  - [Second Normal Form (2NF)](#second-normal-form-2nf)
  - [Third Normal Form (3NF)](#third-normal-form-3nf)
- [Final Database Schema](#final-database-schema)
- [Getting Started](#getting-started)

---

## Introduction

Welcome to **DB_Assignment_3**, a comprehensive project that delves into the practical application of database normalization principles. This assignment demonstrates the transformation of an unnormalized dataset into a fully normalized database, adhering to the First, Second, and Third Normal Forms (1NF, 2NF, and 3NF).

By the end of this project, you'll have a clear understanding of how normalization enhances database design by eliminating redundancy, reducing anomalies, and improving data integrity.

---

## Data Overview

The dataset provided (`Unnormalized_data.csv`) contains information related to university courses and their associated textbooks. The data includes:

- **Course Information**: Course Registration Number (CRN) and Course Name.
- **Book Details**: ISBN, Title, Edition, Pages, and Year of Publication.
- **Authors**: Names of authors (often multiple authors in a single field).
- **Publisher Details**: Publisher Name and Address.

**Challenges with the Unnormalized Data**:

- **Redundancy**: Repeated information across multiple records.
- **Non-Atomic Fields**: Fields containing multiple values (e.g., multiple authors in one field).
- **Anomalies**: Potential for insertion, update, and deletion anomalies due to poor database structure.

---

## Project Objectives

- **Apply Normalization Principles**: Transform the unnormalized dataset into 1NF, 2NF, and 3NF.
- **Design an Efficient Database Schema**: Create a logical and optimized structure for data storage.
- **Enhance Data Integrity**: Ensure accuracy and consistency throughout the database.
- **Eliminate Redundancy**: Reduce duplicate data to save storage space and prevent anomalies.
- **Establish Clear Relationships**: Define relationships between entities using primary and foreign keys.

---

## Normalization Process

### First Normal Form (1NF)

**Goal**: Ensure that all attributes contain only atomic (indivisible) values and that each record is unique.

**Actions Taken**:

- **Atomic Fields**: Split multi-valued attributes (e.g., authors) into separate records so that each field contains only one value.
- **Unique Records**: Ensured that each record can be uniquely identified by a primary key.

**Result**: A table where each cell contains only a single value, eliminating repeating groups and arrays.

### Second Normal Form (2NF)

**Goal**: Eliminate partial dependencies; all non-key attributes must be fully functionally dependent on the primary key.

**Actions Taken**:

- **Entity Separation**: Divided data into distinct tables based on entities:
  - **Courses**
  - **Books**
  - **Authors**
- **Composite Keys**: Identified cases where composite primary keys are necessary.
- **Associative Entities**: Created linking tables to handle many-to-many relationships:
  - **CourseBook**: Links courses and books.
  - **BookAuthor**: Links books and authors.

**Result**: Each table contains data about one entity, and relationships are maintained without redundancy.

### Third Normal Form (3NF)

**Goal**: Remove transitive dependencies; non-key attributes should depend only on the primary key.

**Actions Taken**:

- **Isolated Dependent Attributes**: Moved publisher information to a separate **Publication** table.
- **Updated Relationships**: Established new relationships between books and publishers via an associative table **BookPublication**.
- **Removed Redundancy**: Ensured that non-key attributes are not dependent on other non-key attributes.

**Result**: A refined database schema where each non-key attribute depends solely on the primary key, ensuring data integrity and minimizing redundancy.

---

## Final Database Schema

The final database schema consists of the following tables:

1. **Courses**
   - *Primary Key*: `CRN`
   - *Attributes*: `Course_Name`

2. **Books**
   - *Primary Key*: `ISBN`
   - *Attributes*: `Title`, `Edition`, `Pages`, `Year`

3. **Authors**
   - *Primary Key*: `Author_ID`
   - *Attributes*: `Author_Name`

4. **Publication**
   - *Primary Key*: `Publication_ID`
   - *Attributes*: `Publisher_Name`, `Publisher_Address`

5. **CourseBook** *(Associative Table)*
   - *Composite Primary Key*: `CRN`, `ISBN`
   - *Purpose*: Associates courses with their textbooks.

6. **BookAuthor** *(Associative Table)*
   - *Composite Primary Key*: `ISBN`, `Author_ID`
   - *Purpose*: Associates books with their authors.

7. **BookPublication** *(Associative Table)*
   - *Composite Primary Key*: `ISBN`, `Publication_ID`
   - *Purpose*: Associates books with their publishers.

**Benefits of the Normalized Schema**:

- **Data Integrity**: Improved accuracy and consistency.
- **Reduced Redundancy**: Eliminated unnecessary duplication of data.
- **Optimized Queries**: Enhanced performance for data retrieval and manipulation.
- **Scalability**: Easier to maintain and extend the database as requirements evolve.

---

## Getting Started

To explore and interact with this project:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/RahimaKarimova/DB_Assignment_3.git
