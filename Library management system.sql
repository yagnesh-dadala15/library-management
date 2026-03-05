create database Library_db;
Use library_db;

create table book(
book_id int PRIMARY KEY,
ISBN VARCHAR(10),
Book_title VARCHAR(200) NOT NULL,
Category_id int,
Publisher_id int,
publisher_year int,
book_edition varchar(30),
copies_total int,
copies_available int,
location_id int,
FOREIGN KEY (category_id) REFERENCES category(category_id), 
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
FOREIGN KEY (location_id) REFERENCES location(location_id)
);
describe book;
select * from book;

CREATE TABLE category(
category_id int PRIMARY KEY,
category_name varchar(30) NOT NULL
);

CREATE TABLE publisher(
publisher_id int PRIMARY KEY,
publisher_name varchar(30) NOT NULL,
publishcation_language varchar(30),
publication_type varchar(30)
);
describe publisher;

CREATE TABLE location(
location_id int PRIMARY KEY,
shelf_no VARCHAR(100),
shelf_name varchar(100),
floor_no int
);
describe location;

CREATE TABLE book_request(
request_id int PRIMARY KEY,
book_id int,
member_id int,
availabe_status_id int,
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (member_id) REFERENCES members(member_id),
FOREIGN KEY (availabe_status_id) REFERENCES book_request_status(availabe_status_id)
);
describe book_request;

CREATE TABLE book_request_status(
availabe_status_id int PRIMARY KEY,
available_status varchar(100),
nearest_available_date DATE,
publication_type varchar(30)
);
describe book_request_status;

CREATE TABLE members(
member_id int PRIMARY KEY,
first_name varchar(30),
last_name varchar(30),
city varchar(30),
mobile_no int(30),
email_id varchar(250),
date_of_birth DATE,
active_status_id int,
FOREIGN KEY (active_status_id) REFERENCES member_status(active_status_id)
);
describe members;

CREATE TABLE member_status(
active_status_id int PRIMARY KEY,
account_type varchar(30),
account_status varchar(30),
membership_start_date DATE,
membership_end_date DATE
);
alter table member_status rename column avtive_status_id to active_status_id;
ALTER TABLE member_status
MODIFY COLUMN active_status_id VARCHAR(100);
Describe member_status;

CREATE TABLE book_author(
book_id int,
author_id int,
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (author_id) REFERENCES author(author_id)
);
describe book_author;

CREATE TABLE author(
author_id int PRIMARY KEY,
first_name varchar(200),
last_name varchar(200)
);
describe author;

CREATE TABLE book_issue(
issue_id int PRIMARY KEY,
book_id int,
member_id int,
issue_date DATE,
return_date DATE,
issue_status varchar(200),
issue_by_id int,
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (member_id) REFERENCES members(member_id),
FOREIGN KEY (issue_by_id) REFERENCES library_staff(issue_by_id)
);
describe book_isseu;

CREATE TABLE library_staff(
issue_by_id int PRIMARY KEY,
staff_name varchar(200),
staff_designation varchar(200)
);
describe library_staff;

CREATE TABLE fine_due(
fine_id int PRIMARY KEY,
member_id int,
issue_id int,
fine_date varchar(200),
fine_total int,
FOREIGN KEY (member_id) REFERENCES members(member_id),
FOREIGN KEY (issue_id) REFERENCES book_issue(issue_id)
);
describe fine_due;

CREATE TABLE library_stafff(
fine_payment_id int PRIMARY KEY,
member_id int,
payment_date varchar(200),
payment_amount int,
FOREIGN KEY (member_id) REFERENCES members(member_id)
);
describe library_stafff;

INSERT INTO category (category_id, category_name) VALUES
(1, 'Smartphones'), (2, 'Laptops'), (3, 'Desktop Computers'), (4, 'Computer Accessories'), 
(5, 'Tablets'), (6, 'Monitors'), (7, 'Printers and Scanners'), (8, 'Networking Equipment'), 
(9, 'External Storage'), (10, 'Software'), (11, 'Audio Equipment'), (12, 'Headphones'), 
(13, 'Cameras and Photography'), (14, 'Video Games'), (15, 'Gaming Consoles'), (16, 'Wearable Technology'), 
(17, 'Smart Home Devices'), (18, 'Televisions'), (19, 'Home Theater Systems'), (20, 'Projectors'), 
(21, 'Major Appliances'), (22, 'Small Kitchen Appliances'), (23, 'Cookware'), (24, 'Bakeware'), 
(25, 'Kitchen Utensils'), (26, 'Dining and Entertaining'), (27, 'Furniture'), (28, 'Home Decor'), 
(29, 'Lighting'), (30, 'Bedding'), (31, 'Bath Products'), (32, 'Storage and Organization'), 
(33, 'Cleaning Supplies'), (34, 'Heating and Cooling'), (35, 'Home Improvement Tools'), (36, 'Gardening Equipment'), 
(37, 'Outdoor Furniture'), (38, 'Grills and Outdoor Cooking'), (39, 'Pool and Spa Supplies'), (40, 'Pet Supplies - Dogs'), 
(41, 'Pet Supplies - Cats'), (42, 'Pet Supplies - Fish'), (43, 'Pet Supplies - Small Animals'), (44, 'Baby Clothing'), 
(45, 'Baby Gear'), (46, 'Toys and Games'), (47, 'Action Figures'), (48, 'Dolls and Accessories'), 
(49, 'Puzzles and Brain Teasers'), (50, 'Board Games'), (51, 'Arts and Crafts'), (52, 'Office Supplies'), 
(53, 'Stationery'), (54, 'Books - Fiction'), (55, 'Books - Non-Fiction'), (56, 'Books - Children'), 
(57, 'Books - Education'), (58, 'Musical Instruments'), (59, 'Music Accessories'), (60, 'Movies and TV Shows'), 
(61, 'Mens Clothing'), (62, 'Womens Clothing'), (63, 'Kids Clothing'), (64, 'Shoes - Mens'), 
(65, 'Shoes - Womens'), (66, 'Shoes - Kids'), (67, 'Accessories - Bags'), (68, 'Accessories - Jewelry'), 
(69, 'Accessories - Watches'), (70, 'Accessories - Eyewear'), (71, 'Beauty - Makeup'), (72, 'Beauty - Skincare'), 
(73, 'Beauty - Haircare'), (74, 'Beauty - Fragrances'), (75, 'Personal Care - Oral'), (76, 'Health - Vitamins'), 
(77, 'Health - Equipment'), (78, 'Fitness - Cardio'), (79, 'Fitness - Strength'), (80, 'Fitness - Yoga'), 
(81, 'Outdoor - Camping'), (82, 'Outdoor - Hiking'), (83, 'Outdoor - Cycling'), (84, 'Sports - Basketball'), 
(85, 'Sports - Soccer'), (86, 'Sports - Tennis'), (87, 'Sports - Golf'), (88, 'Sports - Swimming'), 
(89, 'Automotive - Parts'), (90, 'Automotive - Tools'), (91, 'Automotive - Car Care'), (92, 'Industrial - Safety'), 
(93, 'Industrial - Hardware'), (94, 'Food - Snacks'), (95, 'Food - Beverages'), (96, 'Food - Pantry Staples'), 
(97, 'Food - Fresh Produce'), (98, 'Food - Frozen'), (99, 'Holiday Decor'), (100, 'Gift Cards');

INSERT INTO publisher (publisher_id, publisher_name, publishcation_language, publication_type) VALUES
(1, 'Global Media Group', 'English', 'Journalism'),
(2, 'Berlin Academic Press', 'German', 'Scientific Journal'),
(3, 'Tokyo Manga House', 'Japanese', 'Graphic Novel'),
(4, 'Paris Belle Lettres', 'French', 'Literature'),
(5, 'Madrid Mundo', 'Spanish', 'Daily News'),
(6, 'Nordic Sci-Fi', 'Swedish', 'Fiction'),
(7, 'Seoul Tech Review', 'Korean', 'Technology'),
(8, 'Milan Mode', 'Italian', 'Fashion Magazine'),
(9, 'Beijing Educational', 'Mandarin', 'Textbook'),
(10, 'Delhi Star Publications', 'Hindi', 'Entertainment'),
(11, 'Toronto Travel Guides', 'English', 'Travel'),
(12, 'Lisbon History Press', 'Portuguese', 'Non-Fiction'),
(13, 'Cairo Al-Kitab', 'Arabic', 'Philosophy'),
(14, 'Sydney Coast Books', 'English', 'Lifestyle'),
(15, 'Moscow Pravda Books', 'Russian', 'Politics'),
(16, 'Amsterdam Arts', 'Dutch', 'Fine Arts'),
(17, 'Bangkok Lotus Press', 'Thai', 'Spirituality'),
(18, 'Athens Classics', 'Greek', 'History'),
(19, 'Vienna Music Notes', 'German', 'Musicology'),
(20, 'Brussels Euro Print', 'French', 'Legal');

INSERT INTO location (location_id, shelf_no, shelf_name, floor_no) VALUES
(1, 'A-101', 'North Wing - General Fiction', 1),
(2, 'A-102', 'North Wing - General Fiction', 1),
(3, 'A-103', 'North Wing - Mystery', 1),
(4, 'B-201', 'South Wing - Biography', 1),
(5, 'B-202', 'South Wing - Biography', 1),
(6, 'C-301', 'East Wing - Childrens Section', 1),
(7, 'C-302', 'East Wing - Childrens Section', 1),
(8, 'D-401', 'West Wing - Reference', 1),
(9, 'E-501', 'Main Lobby - New Arrivals', 1),
(10, 'F-101', 'Science Section - Biology', 2),
(11, 'F-102', 'Science Section - Chemistry', 2),
(12, 'F-103', 'Science Section - Physics', 2),
(13, 'G-201', 'History - Ancient', 2),
(14, 'G-202', 'History - Medieval', 2),
(15, 'G-203', 'History - Modern', 2),
(16, 'H-301', 'Arts - Fine Arts', 2),
(17, 'H-302', 'Arts - Music', 2),
(18, 'I-401', 'Geography - Maps', 2),
(19, 'J-501', 'Philosophy - Western', 2),
(20, 'K-101', 'Technology - Software', 3);

INSERT INTO book_request_status (availabe_status_id, available_status, nearest_available_date, publication_type) VALUES
(1, 'Available', '2026-02-09', 'Hardcover'),
(2, 'On Loan', '2026-02-23', 'Paperback'),
(3, 'Reserved', '2026-02-15', 'Journal'),
(4, 'In Processing', '2026-02-12', 'E-Book'),
(5, 'Lost', NULL, 'Periodical'),
(6, 'Damaged', '2026-03-01', 'Hardcover'),
(7, 'On Hold', '2026-02-11', 'Magazine'),
(8, 'Available', '2026-02-09', 'Reference'),
(9, 'Inter-Library Loan', '2026-03-15', 'Manuscript'),
(10, 'Binding Repair', '2026-04-10', 'Hardcover');

INSERT INTO member_status (active_status_id, account_type, account_status, membership_start_date, membership_end_date) VALUES
(1, 'Premium', 'Active', '2025-01-15', '2026-01-15'),
(2, 'Basic', 'Active', '2025-06-01', '2026-06-01'),
(3, 'Student', 'Active', '2025-09-10', '2026-09-10'),
(4, 'Premium', 'Expired', '2024-01-01', '2025-01-01'),
(5, 'Staff', 'Active', '2023-03-15', '2028-03-15'),
(6, 'Basic', 'Suspended', '2025-02-10', '2026-02-10'),
(7, 'Student', 'Active', '2025-08-20', '2026-08-20'),
(8, 'Corporate', 'Active', '2025-05-05', '2026-05-05'),
(9, 'Basic', 'Active', '2025-11-12', '2026-11-12'),
(10, 'Premium', 'Active', '2026-01-20', '2027-01-20');

INSERT INTO author (author_id, first_name, last_name) VALUES
(1, 'James', 'Clear'), (2, 'Joanne', 'Rowling'), (3, 'George', 'Martin'), (4, 'Stephen', 'King'), 
(5, 'Agatha', 'Christie'), (6, 'Ernest', 'Hemingway'), (7, 'Scott', 'Fitzgerald'), (8, 'Arthur', 'Doyle'), 
(9, 'Gabriel', 'Marquez'), (10, 'Haruki', 'Murakami'), (11, 'Chimamanda', 'Adichie'), (12, 'Mark', 'Twain'), 
(13, 'Jane', 'Austen'), (14, 'Charles', 'Dickens'), (15, 'Leo', 'Tolstoy'), (16, 'Virginia', 'Woolf'), 
(17, 'Franz', 'Kafka'), (18, 'James', 'Joyce'), (19, 'Albert', 'Camus'), (20, 'Simone', 'Beauvoir'),
(21, 'Toni', 'Morrison'), (22, 'Maya', 'Angelou'), (23, 'William', 'Shakespeare'), (24, 'Fyodor', 'Dostoevsky'),
(25, 'Marcel', 'Proust'), (26, 'Oscar', 'Wilde'), (27, 'Victor', 'Hugo'), (28, 'Adam', 'Smith'),
(29, 'Emily', 'Dickinson'), (30, 'Robert', 'Frost'), (31, 'Langston', 'Hughes'), (32, 'Sylvia', 'Plath'),
(33, 'Walt', 'Whitman'), (34, 'Pablo', 'Neruda'), (35, 'Philip', 'Kotler'), (36, 'Jared', 'Diamond'),
(37, 'Yuval', 'Harari'), (38, 'Malcolm', 'Gladwell'), (39, 'Carl', 'Sagan'), (40, 'Neil', 'Tyson'),
(41, 'Richard', 'Dawkins'), (42, 'Stephen', 'Hawking'), (43, 'Noam', 'Chomsky'), (44, 'Stan', 'Lee'),
(45, 'Jack', 'Kirby'), (46, 'Frank', 'Miller'), (47, 'Alan', 'Moore'), (48, 'Jean', 'Piaget'),
(49, 'B.F.', 'Skinner'), (50, 'Sigmund', 'Freud'), (51, 'Carl', 'Jung'), (52, 'Alfred', 'Adler'),
(53, 'Erik', 'Erikson'), (54, 'Abraham', 'Maslow'), (55, 'John', 'Dewey'), (56, 'Paulo', 'Freire'),
(57, 'Thomas', 'Kuhn'), (58, 'Karl', 'Popper'), (59, 'Michel', 'Foucault'), (60, 'Judith', 'Butler'),
(61, 'Zadie', 'Smith'), (62, 'Kazuo', 'Ishiguro'), (63, 'Margaret', 'Atwood'), (64, 'Elena', 'Ferrante'),
(65, 'Ian', 'McEwan'), (66, 'Salman', 'Rushdie'), (67, 'Arundhati', 'Roy'), (68, 'Jhumpa', 'Lahiri'),
(69, 'Alice', 'Walker'), (70, 'Amy', 'Tan'), (71, 'Isabel', 'Allende'), (72, 'Paulo', 'Coelho'),
(73, 'Orhan', 'Pamuk'), (74, 'Milan', 'Kundera'), (75, 'Umberto', 'Eco'), (76, 'Italo', 'Calvino'),
(77, 'Jorge', 'Borges'), (78, 'Chinua', 'Achebe'), (79, 'Wole', 'Soyinka'), (80, 'Naguib', 'Mahfouz'),
(81, 'Rumi', 'Balkhi'), (82, 'Khalil', 'Gibran'), (83, 'Omar', 'Khayyam'), (84, 'Matsuo', 'Basho'),
(85, 'Li', 'Bai'), (86, 'Du', 'Fu'), (87, 'Rabindranath', 'Tagore'), (88, 'Vikram', 'Seth'),
(89, 'R.K.', 'Narayan'), (90, 'Anita', 'Desai'), (91, 'Khushwant', 'Singh'), (92, 'Robert', 'Martin'),
(93, 'Martin', 'Fowler'), (94, 'Kent', 'Beck'), (95, 'Linus', 'Torvalds'), (96, 'Ada', 'Lovelace'),
(97, 'Grace', 'Hopper'), (98, 'Alan', 'Turing'), (99, 'Donald', 'Knuth'), (100, 'Sarah', 'Green');

INSERT INTO library_staff (issue_by_id, staff_name, staff_designation) VALUES
(1, 'Alice Thompson', 'Head Librarian'),
(2, 'Bob Richards', 'Assistant Librarian'),
(3, 'Charlie Davis', 'Cataloger'),
(4, 'Diana Prince', 'Archivist'),
(5, 'Edward Norton', 'Technical Assistant'),
(6, 'Fiona Glenanne', 'Circulation Manager'),
(7, 'George Miller', 'Library Aide'),
(8, 'Hannah Abbott', 'Reference Librarian'),
(9, 'Ian Wright', 'Digital Services Specialist'),
(10, 'Julia Roberts', 'Senior Librarian'),
(11, 'Kevin Hart', 'Assistant Librarian'),
(12, 'Laura Palmer', 'Media Specialist'),
(13, 'Michael Scott', 'Administrative Assistant'),
(14, 'Nancy Drew', 'Research Specialist'),
(15, 'Oscar Martinez', 'Accounting Clerk'),
(16, 'Peter Parker', 'Evening Supervisor'),
(17, 'Quinn Fabray', 'Library Technician'),
(18, 'Riley Reid', 'Collections Manager'),
(19, 'Steven Strange', 'Preservationist'),
(20, 'Tina Fey', 'Youth Services Librarian');

INSERT INTO book_author (book_id, author_id) VALUES
(1, 10), (2, 92), (3, 18), (4, 8), (5, 26), (6, 65), (7, 91), (8, 60), (9, 61), (10, 4);

INSERT INTO book 
(book_id, ISBN, Book_title, Category_id, Publisher_id, publisher_year, book_edition, copies_total, copies_available, location_id) 
VALUES
(1, '1000000001', 'Introduction to Programming', 1, 1, 2020, '1st Edition', 10, 8, 1),
(2, '1000000002', 'Data Structures Basics', 1, 1, 2021, '2nd Edition', 12, 10, 1),
(3, '1000000003', 'Database Management Systems', 1, 1, 2019, '3rd Edition', 8, 6, 1),
(4, '1000000004', 'Operating System Concepts', 1, 1, 2018, '1st Edition', 7, 5, 1),
(5, '1000000005', 'Computer Networks Guide', 1, 1, 2022, '2nd Edition', 9, 7, 1),
(6, '1000000006', 'Software Engineering Principles', 1, 1, 2020, '1st Edition', 11, 9, 1),
(7, '1000000007', 'Artificial Intelligence Basics', 1, 1, 2023, '1st Edition', 6, 4, 1),
(8, '1000000008', 'Machine Learning Handbook', 1, 1, 2022, '2nd Edition', 10, 8, 1),
(9, '1000000009', 'Python for Beginners', 1, 1, 2021, '3rd Edition', 15, 12, 1),
(10, '1000000010', 'Java Programming Guide', 1, 1, 2019, '2nd Edition', 13, 10, 1),
(11, '1000000011', 'Web Development Essentials', 1, 1, 2020, '1st Edition', 9, 6, 1),
(12, '1000000012', 'Cloud Computing Concepts', 1, 1, 2023, '1st Edition', 7, 5, 1),
(13, '1000000013', 'Cyber Security Fundamentals', 1, 1, 2022, '2nd Edition', 8, 6, 1),
(14, '1000000014', 'Big Data Analytics', 1, 1, 2021, '1st Edition', 10, 7, 1),
(15, '1000000015', 'Internet of Things Basics', 1, 1, 2020, '1st Edition', 6, 4, 1),
(16, '1000000016', 'Mobile App Development', 1, 1, 2022, '2nd Edition', 11, 9, 1),
(17, '1000000017', 'C Programming Language', 1, 1, 2018, '4th Edition', 14, 11, 1),
(18, '1000000018', 'C++ Programming Advanced', 1, 1, 2019, '3rd Edition', 12, 9, 1),
(19, '1000000019', 'Data Science Introduction', 1, 1, 2023, '1st Edition', 9, 7, 1),
(20, '1000000020', 'Blockchain Technology Basics', 1, 1, 2022, '1st Edition', 5, 3, 1);

INSERT INTO members
(member_id, first_name, last_name, city, mobile_no, email_id, date_of_birth, active_status_id)
VALUES
(1, 'Ravi', 'Kumar', 'Vijayawada', 912345678, 'ravi.kumar1@gmail.com', '1998-05-12', 1),
(2, 'Sneha', 'Reddy', 'Hyderabad', 923456781, 'sneha.reddy2@gmail.com', '1997-03-22', 1),
(3, 'Arjun', 'Naidu', 'Guntur', 934567812, 'arjun.naidu3@gmail.com', '1995-11-10', 2),
(4, 'Pooja', 'Sharma', 'Chennai', 945678123, 'pooja.sharma4@gmail.com', '1999-07-18', 1),
(5, 'Kiran', 'Patel', 'Ahmedabad', 956781234, 'kiran.patel5@gmail.com', '1996-02-25', 1),
(6, 'Anjali', 'Verma', 'Delhi', 967812345, 'anjali.verma6@gmail.com', '2000-09-14', 2),
(7, 'Rahul', 'Singh', 'Mumbai', 978123456, 'rahul.singh7@gmail.com', '1994-12-01', 1),
(8, 'Meena', 'Iyer', 'Bangalore', 989234567, 'meena.iyer8@gmail.com', '1998-06-30', 1),
(9, 'Suresh', 'Yadav', 'Lucknow', 901345678, 'suresh.yadav9@gmail.com', '1993-08-21', 2),
(10, 'Divya', 'Nair', 'Kochi', 912456789, 'divya.nair10@gmail.com', '1997-04-11', 1),
(11, 'Vikram', 'Chowdhury', 'Kolkata', 923567890, 'vikram.c11@gmail.com', '1992-10-05', 1),
(12, 'Lakshmi', 'Priya', 'Vijayawada', 934678901, 'lakshmi.p12@gmail.com', '1999-01-17', 2),
(13, 'Manoj', 'Das', 'Bhubaneswar', 945789012, 'manoj.das13@gmail.com', '1996-03-09', 1),
(14, 'Keerthi', 'Rao', 'Mysore', 956890123, 'keerthi.rao14@gmail.com', '1998-11-28', 1),
(15, 'Naveen', 'Joshi', 'Pune', 967901234, 'naveen.j15@gmail.com', '1995-07-07', 2),
(16, 'Swathi', 'Menon', 'Trivandrum', 978012345, 'swathi.m16@gmail.com', '2001-02-19', 1),
(17, 'Prakash', 'Gupta', 'Jaipur', 989123450, 'prakash.g17@gmail.com', '1993-06-15', 1),
(18, 'Asha', 'Kulkarni', 'Nagpur', 901234561, 'asha.k18@gmail.com', '1997-09-03', 2),
(19, 'Teja', 'Varma', 'Vizag', 912345672, 'teja.v19@gmail.com', '1998-12-12', 1),
(20, 'Harsha', 'Pillai', 'Coimbatore', 923456783, 'harsha.p20@gmail.com', '1994-04-27', 1);

INSERT INTO book_request
(request_id, book_id, member_id, availabe_status_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 3),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 3),
(10, 10, 10, 1),
(11, 11, 11, 2),
(12, 12, 12, 1),
(13, 13, 13, 3),
(14, 14, 14, 1),
(15, 15, 15, 2),
(16, 16, 16, 1),
(17, 17, 17, 3),
(18, 18, 18, 1),
(19, 19, 19, 2),
(20, 20, 20, 1);

INSERT INTO book_issue
(issue_id, book_id, member_id, issue_date, return_date, issue_status, issue_by_id)
VALUES
(1, 1, 1, '2024-01-10', '2024-01-20', 'Returned', 1),
(2, 2, 2, '2024-01-12', '2024-01-22', 'Returned', 2),
(3, 3, 3, '2024-01-15', '2024-01-25', 'Pending', 3),
(4, 4, 4, '2024-01-18', '2024-01-28', 'Returned', 1),
(5, 5, 5, '2024-01-20', '2024-01-30', 'Pending', 2),
(6, 6, 6, '2024-02-01', '2024-02-11', 'Returned', 3),
(7, 7, 7, '2024-02-03', '2024-02-13', 'Pending', 4),
(8, 8, 8, '2024-02-05', '2024-02-15', 'Returned', 1),
(9, 9, 9, '2024-02-07', '2024-02-17', 'Pending', 2),
(10, 10, 10, '2024-02-10', '2024-02-20', 'Returned', 3),
(11, 11, 11, '2024-02-12', '2024-02-22', 'Pending', 4),
(12, 12, 12, '2024-02-15', '2024-02-25', 'Returned', 5),
(13, 13, 13, '2024-02-18', '2024-02-28', 'Pending', 1),
(14, 14, 14, '2024-02-20', '2024-03-01', 'Returned', 2),
(15, 15, 15, '2024-02-22', '2024-03-03', 'Pending', 3),
(16, 16, 16, '2024-03-01', '2024-03-11', 'Returned', 4),
(17, 17, 17, '2024-03-03', '2024-03-13', 'Pending', 5),
(18, 18, 18, '2024-03-05', '2024-03-15', 'Returned', 1),
(19, 19, 19, '2024-03-07', '2024-03-17', 'Pending', 2),
(20, 20, 20, '2024-03-10', '2024-03-20', 'Returned', 3);

INSERT INTO fine_due
(fine_id, member_id, issue_id, fine_date, fine_total)
VALUES
(1, 1, 1, '2024-01-25', 50),
(2, 2, 2, '2024-01-28', 30),
(3, 3, 3, '2024-02-01', 70),
(4, 4, 4, '2024-02-05', 20),
(5, 5, 5, '2024-02-10', 100),
(6, 6, 6, '2024-02-15', 40),
(7, 7, 7, '2024-02-18', 60),
(8, 8, 8, '2024-02-22', 25),
(9, 9, 9, '2024-02-25', 80),
(10, 10, 10, '2024-03-01', 35),
(11, 11, 11, '2024-03-05', 55),
(12, 12, 12, '2024-03-08', 45),
(13, 13, 13, '2024-03-12', 90),
(14, 14, 14, '2024-03-15', 20),
(15, 15, 15, '2024-03-18', 65),
(16, 16, 16, '2024-03-20', 30),
(17, 17, 17, '2024-03-22', 75),
(18, 18, 18, '2024-03-25', 50),
(19, 19, 19, '2024-03-28', 40),
(20, 20, 20, '2024-04-01', 85);

INSERT INTO library_stafff
(fine_payment_id, member_id, payment_date, payment_amount)
VALUES
(1, 1, '2024-01-26', 50),
(2, 2, '2024-01-29', 30),
(3, 3, '2024-02-02', 70),
(4, 4, '2024-02-06', 20),
(5, 5, '2024-02-11', 100),
(6, 6, '2024-02-16', 40),
(7, 7, '2024-02-19', 60),
(8, 8, '2024-02-23', 25),
(9, 9, '2024-02-26', 80),
(10, 10, '2024-03-02', 35),
(11, 11, '2024-03-06', 55),
(12, 12, '2024-03-09', 45),
(13, 13, '2024-03-13', 90),
(14, 14, '2024-03-16', 20),
(15, 15, '2024-03-19', 65),
(16, 16, '2024-03-21', 30),
(17, 17, '2024-03-23', 75),
(18, 18, '2024-03-26', 50),
(19, 19, '2024-03-29', 40),
(20, 20, '2024-04-02', 85);

SELECT 
b.book_id,
b.book_title,
c.category_name,
p.publisher_name,
l.shelf_name,
b.copies_total,
c.category_id,
b.copies_available
FROM book b
JOIN category c ON b.category_id = c.category_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN location l ON b.location_id = l.location_id;

SELECT 
b.book_title,
a.first_name,
a.last_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

SELECT 
bi.issue_id,
b.book_title,
m.first_name,
m.last_name,
bi.issue_date,
bi.return_date,
bi.issue_status,
ls.staff_name
FROM book_issue bi
JOIN book b ON bi.book_id = b.book_id
JOIN members m ON bi.member_id = m.member_id
JOIN library_staff ls ON bi.issue_by_id = ls.issue_by_id;

SELECT 
m.member_id,
m.first_name,
m.last_name,
m.city,
ms.account_status,
ms.membership_start_date
FROM members m
JOIN member_status ms 
ON m.active_status_id = ms.active_status_id;

SELECT 
br.request_id,
b.book_title,
m.first_name,
m.last_name,
brs.available_status
FROM book_request br
JOIN book b ON br.book_id = b.book_id
JOIN members m ON br.member_id = m.member_id
JOIN book_request_status brs 
ON br.availabe_status_id = brs.availabe_status_id;

SELECT 
fd.fine_id,
m.first_name,
b.book_title,
fd.fine_date,
fd.fine_total
FROM fine_due fd
JOIN members m ON fd.member_id = m.member_id
JOIN book_issue bi ON fd.issue_id = bi.issue_id
JOIN book b ON bi.book_id = b.book_id;

SELECT 
lp.fine_payment_id,
m.first_name,
lp.payment_date,
lp.payment_amount
FROM library_stafff lp
JOIN members m ON lp.member_id = m.member_id;

SELECT 
b.book_title,
c.category_name,
p.publisher_name,
a.first_name AS author_first,
m.first_name AS member_name,
bi.issue_date,
fd.fine_total
FROM book b
LEFT JOIN category c ON b.category_id = c.category_id
LEFT JOIN publisher p ON b.publisher_id = p.publisher_id
LEFT JOIN book_author ba ON b.book_id = ba.book_id
LEFT JOIN author a ON ba.author_id = a.author_id
LEFT JOIN book_issue bi ON b.book_id = bi.book_id
LEFT JOIN members m ON bi.member_id = m.member_id
LEFT JOIN fine_due fd ON bi.issue_id = fd.issue_id;
---------------------------------------------------------------------------------------------------------------------------
select * from book where copies_available > 0;

SELECT b.book_title, c.category_name, p.publisher_name   
FROM book b
JOIN category c ON b.category_id = c.category_id
JOIN publisher p ON b.publisher_id = p.publisher_id;

SELECT * FROM members;

SELECT * FROM book WHERE publisher_year > 2020;

SELECT b.*
FROM book b
JOIN category c ON b.category_id = c.category_id
WHERE c.category_name = 'Science';

SELECT * FROM members WHERE city = 'Hyderabad';

SELECT * FROM book WHERE author = 'C.J. Date';

select * from book where copies_available > 5;

select * from member_status where membership_start_date > 2022-12-31;

select * from book where book_title like 'Data%';

select * from book order by book_title ASC;

SELECT * FROM MEMBERS WHERE DATE_OF_BIRTH > 2000-04-20;

SELECT *
FROM book
ORDER BY publisher_year DESC
LIMIT 10;

SELECT COUNT(*) FROM book;

SELECT category_id, COUNT(*) 
FROM book
GROUP BY category_id;

SELECT COUNT(*) FROM members;

SELECT MAX(copies_available), MIN(copies_available)
FROM book;

SELECT publisher_id, COUNT(*)
FROM book
GROUP BY publisher_id;

SELECT category_id, COUNT(*) total
FROM book
GROUP BY category_id
HAVING COUNT(*) > 10;

SELECT publisher_id, COUNT(*)
FROM book
GROUP BY publisher_id
HAVING COUNT(*) > 5;

SELECT member_id, COUNT(*) 
FROM issue
GROUP BY member_id;

SELECT category_id, COUNT(*)
FROM book
GROUP BY category_id
HAVING COUNT(*) < 3;

SELECT b.book_title, c.category_name
FROM book b
JOIN category c ON b.category_id = c.category_id;

SELECT b.book_title, p.publisher_name
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id;

SELECT *
FROM book_issue
WHERE return_date IS NULL;

SELECT *
FROM book_issue
WHERE return_date IS NULL
AND issue_date < CURDATE() - INTERVAL 15 DAY;

SELECT *
FROM members
WHERE member_id NOT IN (SELECT member_id FROM book_issue);

SELECT book_id, COUNT(*) total
FROM book
GROUP BY book_id
HAVING COUNT(*) > 5;

INSERT INTO book
VALUES (101,'ISBN1','New Book',1,1,2024,'1st',10,10,1);

UPDATE book
SET copies_available = copies_available - 1
WHERE book_id = 101;
select * from book;

DELETE FROM members
WHERE member_id = 5;

UPDATE publisher
SET publisher_name = 'New Name'
WHERE publisher_id = 2;

SELECT book_id, COUNT(*) total
FROM book_issue
GROUP BY book_id
ORDER BY total DESC
LIMIT 1;

SELECT member_id, COUNT(*) total
FROM book_issue
GROUP BY member_id
ORDER BY total DESC
LIMIT 1;

SELECT *
FROM book
WHERE book_id NOT IN (SELECT book_id FROM book_issue);

SELECT *
FROM book
WHERE copies_available > 
(SELECT AVG(copies_available) FROM book);

SELECT DISTINCT member_id
FROM book_issue
WHERE book_id IN
(SELECT book_id FROM book_issue WHERE member_id = 1)
AND member_id <> 1;

SELECT *
FROM book
WHERE category_id =
(SELECT category_id
 FROM book
 GROUP BY category_id
 ORDER BY COUNT(*) DESC
 LIMIT 1);

SELECT MONTH(issue_date), COUNT(*)
FROM book_issue
GROUP BY MONTH(issue_date);

SELECT YEAR(issue_date), COUNT(*)
FROM book_issue
GROUP BY YEAR(issue_date);

SELECT isbn, COUNT(*)
FROM book
GROUP BY isbn
HAVING COUNT(*) > 1;

SELECT *
FROM book
WHERE category_id IS NULL;

SELECT *
FROM members
WHERE first_name IS NULL
OR city IS NULL;
