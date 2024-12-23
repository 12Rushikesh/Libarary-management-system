CREATE DATABASE library_management;

USE library_management;

-- Table for storing book information
CREATE TABLE books (
    book_id INT auto_increment primary key ,
    title VARCHAR(255),
    author VARCHAR(255),
    status VARCHAR(20) -- Available, Issued
);


INSERT INTO books (title, author, status) VALUES
('Shivaji: The Great Maratha', 'Ranjit Desai', 'Available'),
('Bajirao Mastani', 'N.S. Inamdar', 'Available'),
('Chhatrapati Shivaji Maharaj', 'Jadunath Sarkar', 'Issued'),
('The Rise of Maratha Power', 'Mahadev Govind Ranade', 'Available'),
('The Era of Baji Rao', 'Uday S. Kulkarni', 'Available'),
('Peshwa: The Lion and the Stallion', 'Ram Sivasankaran', 'Issued'),
('The Life of Shivaji Maharaj', 'Govind Sakharam Sardesai', 'Available'),
('History of the Marathas', 'James Grant Duff', 'Issued'),
('Shivaji and His Times', 'Sir Jadunath Sarkar', 'Available'),
('Aurangzeb and the Marathas', 'Jadunath Sarkar', 'Issued'),
('Raja Shiv Chhatrapati', 'Babasaheb Purandare', 'Available'),
('Marathas and the Mughal System', 'Satish Chandra', 'Available'),
('The Great Indian Mutiny', 'John Harris', 'Issued'),
('The Last Mughal', 'William Dalrymple', 'Available'),
('The Maratha Empire', 'Jaswant Lal Mehta', 'Issued'),
('Shivaji: Hindu King in Islamic India', 'James Laine', 'Available'),
('Panipat 1761', 'Uday S. Kulkarni', 'Available'),
('The History of Marathas', 'Sir James Duff', 'Issued'),
('Jijabai: The Mother of a Great King', 'Babasaheb Purandare', 'Available'),
('The Real History of Marathas', 'Prakash Bhaskar', 'Available'),
('History of Maharashtra', 'Y.G. Pawar', 'Issued'),
('Maharashtra: A Comprehensive History', 'K.R. Singh', 'Available'),
('Sambhaji: A Warrior’s Struggle', 'Vishwas Patil', 'Available'),
('The Sword of Tipu Sultan', 'Bhawani Singh', 'Issued'),
('Rajyavyavastha and Maratha History', 'Vivek Dev', 'Available'),
('Shivaji the Chhatrapati', 'Setu Madhavrao Pagadi', 'Available'),
('Maratha Confederacy: A Study in Conflict', 'A.S. Altekar', 'Issued'),
('Dhangar of Maharashtra', 'Arun G. Dangle', 'Available'),
('Kanhoji Angre: Maratha Navy', 'K.K. Chaudhari', 'Available'),
('Maharashtra and the Freedom Struggle', 'S.P. Patil', 'Issued'),
('The First Battle of Panipat', 'R.D. Palsule', 'Available'),
('Veer Savarkar: Echoes from a Forgotten Past', 'Vikram Sampath', 'Available'),
('Bhima Koregaon Battle', 'Shrirang Godbole', 'Issued'),
('Marathas in Medieval India', 'Shyam Bhatia', 'Available'),
('Battles of Maharashtra', 'Hemant Kulkarni', 'Available'),
('Shivaji and Swarajya', 'Sadashiv Ranade', 'Issued'),
('The Battle of Sinhagad', 'Harish Nimbalkar', 'Available'),
('Rani Laxmibai of Jhansi', 'Vrindavan Lal Verma', 'Issued'),
('Pratapgad: The Stronghold of Shivaji', 'Y.G. Kher', 'Available'),
('Maharashtra: Culture and History', 'Anil Bhave', 'Available'),
('Fort Raigad: Capital of Swarajya', 'A.R. Bhide', 'Issued'),
('The Legacy of Maharashtra', 'Arun Tikekar', 'Available'),
('Chimaji Appa: The Forgotten Hero', 'M.V. Deshpande', 'Available'),
('Baji Rao: Warrior and Statesman', 'T.K. Gupte', 'Issued'),
('Tanhaji: The Unsung Warrior', 'Ajay Thakur', 'Available'),
('Sant Tukaram and Maharashtra', 'G.N. Dandekar', 'Available'),
('History of Pune', 'V.S. Bendre', 'Issued'),
('Marathas in British India', 'Vivek Damle', 'Available');


SELECT * FROM library_management.books;



-- Table for storing student information
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    class VARCHAR(50),
    issued_books INT DEFAULT 0 -- Keeps track of the number of books a student has issued
);

INSERT INTO students (name, class, issued_books) VALUES
('Aarav Joshi', 'Class 10', 2),
('Ishita Patil', 'Class 9', 0),
('Rahul Deshmukh', 'Class 8', 1),
('Sneha Jadhav', 'Class 7', 0),
('Vedant Naik', 'Class 11', 3),
('Aditi Chavan', 'Class 6', 1),
('Sakshi Sawant', 'Class 9', 2),
('Rohan Kamat', 'Class 10', 1),
('Neha Apte', 'Class 8', 0),
('Kunal Shinde', 'Class 7', 3),
('Anjali Salunkhe', 'Class 9', 1),
('Saurabh Bhosale', 'Class 11', 2),
('Priya Kulkarni', 'Class 6', 0),
('Varun Gokhale', 'Class 8', 1),
('Mihir Gaikwad', 'Class 7', 0),
('Tanvi Phatak', 'Class 10', 1),
('Ajay Pawar', 'Class 9', 3),
('Riya Dhavale', 'Class 11', 0),
('Tejas Mali', 'Class 8', 1),
('Shreya Bhise', 'Class 7', 2),
('Vaibhav Khot', 'Class 10', 1),
('Siddharth Sathe', 'Class 6', 0),
('Pooja Mahajan', 'Class 9', 2),
('Kiran Ghadge', 'Class 11', 3),
('Manasi Phadke', 'Class 7', 1),
('Nikhil Thakur', 'Class 10', 0),
('Divya Wagh', 'Class 9', 2),
('Omkar Kharat', 'Class 6', 1),
('Aniket Rane', 'Class 8', 0),
('Gauri More', 'Class 11', 3),
('Pranav Nikam', 'Class 10', 1),
('Swara Kadam', 'Class 7', 2),
('Sahil Zende', 'Class 9', 1),
('Krishna Tandel', 'Class 6', 0),
('Radhika Khatpe', 'Class 8', 1),
('Aditya Karpe', 'Class 10', 2),
('Mrunal Gupte', 'Class 11', 0),
('Yash Ghule', 'Class 9', 1),
('Tanmay Waghmare', 'Class 7', 0),
('Pallavi Patankar', 'Class 8', 3),
('Akshay Kulkarni', 'Class 11', 2),
('Meera Pansare', 'Class 10', 1),
('Ritesh Bane', 'Class 9', 0),
('Nikita Borade', 'Class 6', 1),
('Shubham Ingle', 'Class 7', 3),
('Ankita Gadgil', 'Class 8', 0),
('Parth Kadve', 'Class 11', 2),
('Radha Salve', 'Class 10', 1),
('Suraj Bhandari', 'Class 9', 2);


SELECT * FROM library_management.students;

