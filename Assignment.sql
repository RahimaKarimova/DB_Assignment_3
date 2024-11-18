DROP TABLE IF EXISTS BookAuthor CASCADE;
DROP TABLE IF EXISTS CourseBook CASCADE;
DROP TABLE IF EXISTS BookPublication CASCADE;
DROP TABLE IF EXISTS Authors CASCADE;
DROP TABLE IF EXISTS Books CASCADE;
DROP TABLE IF EXISTS Courses CASCADE;
DROP TABLE IF EXISTS Publication CASCADE;
DROP TABLE IF EXISTS normalized_books_1NF CASCADE;
DROP TABLE IF EXISTS unnormalizedData CASCADE;


CREATE TABLE unnormalizedData (
    CRN INT,
    ISBN VARCHAR(13),
    Title VARCHAR(255),
    Authors VARCHAR(255),
    Edition VARCHAR(50),
    Publisher VARCHAR(255),
    Publisher_Address VARCHAR(255),
    Pages INT,
    Year INT,
    Course_Name VARCHAR(255)
);


-- INSERT INTO unnormalized_books (crn, isbn, title, authors, edition, publisher, publisher_address, pages, year, course_name)
-- VALUES
--     (20424, '133970779', 'Fundamentals of Database Systems 7th Edition', 'Ramez Elmasri, Shamkant Navathe', 7, 'Pearson', '1 Lake Street Upper Saddle River, NJ 07458 United States', 1280, 2018, 'Introduction to DB Systems'),
--     (20424, '1111969604', 'Database Systems: Design, Implementation, and Management', 'Carlos Coronel, Steven Morris, Peter Rob', 10, 'Course Technology', '5 Maxwell Drive, Clifton Park NY 12065, Boston, MA, United States', 752, 2019, 'Introduction to DB Systems'),
--     (20424, '135188148', 'Database Concepts', 'David Kroenke, David Auer, Scott Vandenberg, Robert Yoder', 9, 'Pearson', '1 Lake Street Upper Saddle River, NJ 07458 United States', 552, 2019, 'Introduction to DB Systems'),
--     (10122, '133970779', 'Fundamentals of Database Systems 7th Edition', 'Ramez Elmasri, Shamkant Navathe', 7, 'Pearson', '1 Lake Street Upper Saddle River, NJ 07458 United States', 1280, 2018, 'Big Data and Analytics'),
--     (20451, '1119803780', 'Systems Analysis and Design', 'Alan Dennis, Barbara Wixom, Roberta M. Roth', 7, 'Wiley', '111 River Street, Hoboken, NJ, USA', 464, 2021, 'Systems Analysis & Design'),
--     (31311, '908606273', 'My Cat Likes to Hide in Boxes', 'Lynley Dodd', 1, 'Mallinson Rendel', '5th Flr, 15 Courtnay Place Te Aro, Wellington, New Zealand', 345, 2013, 'Academic Writing'),
--     (10209, '131103627', 'C Programming Language', 'Brian W. Kernighan, Dennis M. Ritchie', 2, 'Pearson', '1 Lake Street Upper Saddle River, NJ 07458 United States', 272, 1988, 'Programming Principles I'),
--     (10209, '1718501048', 'Effective C: An Introduction to Professional C Programming', 'Robert C. Seacord', 2, 'No Starch Press', '329 Primrose Road, #42 Burlingame, CA 94010-4093 USA', 272, 2020, 'Programming Principles I');


-- Loading data into unnormalizedData from CSV file
COPY unnormalizedData (CRN, ISBN, Title, Authors, Edition, Publisher, Publisher_Address, Pages, Year, Course_Name)
FROM '/unnormalize.csv'
DELIMITER ',' CSV HEADER;

-- select * from public.unnormalizeddata

-- 1ST NORMAL FORM
CREATE TABLE normalized_books_1NF AS
SELECT 
    CRN,
    ISBN,
    Title,
    TRIM(UNNEST(STRING_TO_ARRAY(Authors, ', '))) AS Author, -- Split authors into individual rows
    Edition,
    Publisher,
    Publisher_Address,
    Pages,
    Year,
    Course_Name
FROM unnormalizedData;

-- select * from normalized_books_1NF

