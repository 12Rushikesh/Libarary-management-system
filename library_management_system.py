import mysql.connector
from mysql.connector import Error

# Connection to MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='library_management',
            user='root',
            password='rushikesh12#45'  # MySQL root password
        )
        if connection.is_connected():
            print("Connection to MySQL successful")
        return connection
    except Error as e:
        print(f"Error: {e}")
        return None


# Create a student record
def create_student(connection, name, class_, section):
    cursor = connection.cursor()
    query = "INSERT INTO Students (name, class, section) VALUES (%s, %s, %s)"
    cursor.execute(query, (name, class_, section))
    connection.commit()
    print(f"Student {name} added successfully!")


# Create a book record
def create_book(connection, title, author):
    cursor = connection.cursor()
    query = "INSERT INTO Books (title, author) VALUES (%s, %s)"
    cursor.execute(query, (title, author))
    connection.commit()
    print(f"Book {title} by {author} added successfully!")


# Display all students
def display_all_students(connection):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Students")
    rows = cursor.fetchall()
    for row in rows:
        print(row)


# Display all books
def display_all_books(connection):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Books")
    rows = cursor.fetchall()
    for row in rows:
        print(row)


# Issue a book
def issue_book(connection, student_id, book_id):
    cursor = connection.cursor()

    # Check if book is available
    cursor.execute("SELECT available FROM Books WHERE book_id = %s", (book_id,))
    book = cursor.fetchone()
    
    if book and book[0] == 1:
        # Update the student's issued_books count
        cursor.execute("UPDATE Students SET issued_books = issued_books + 1 WHERE student_id = %s", (student_id,))
        
        # Update the book's availability
        cursor.execute("UPDATE Books SET available = 0 WHERE book_id = %s", (book_id,))
        connection.commit()
        print(f"Book {book_id} issued to student {student_id} successfully!")
    else:
        print("Book is not available for issue.")


# Deposit a book
def deposit_book(connection, student_id, book_id):
    cursor = connection.cursor()

    # Update the student's issued_books count
    cursor.execute("UPDATE Students SET issued_books = issued_books - 1 WHERE student_id = %s", (student_id,))
    
    # Update the book's availability
    cursor.execute("UPDATE Books SET available = 1 WHERE book_id = %s", (book_id,))
    connection.commit()
    print(f"Book {book_id} deposited by student {student_id} successfully!")


# Validate admin name
def validate_admin_name(Rushi):
    if not admin_name.strip():
        raise ValueError("Admin name cannot be empty.")
    return admin_name


# Main menu
def main_menu(admin_name):
    connection = create_connection()
    
    if connection is None:
        print("Could not establish database connection.")
        return
    
    while True:
        print("\n--- Library Management System ---")
        print("1. BOOK ISSUE")
        print("2. BOOK DEPOSIT")
        print("3. ADMINISTRATION MENU")
        print("4. EXIT")
        
        choice = input("Enter your choice: ")

        if choice == '1':
            student_id = int(input("Enter Student ID: "))
            book_id = int(input("Enter Book ID: "))
            issue_book(connection, student_id, book_id)
        
        elif choice == '2':
            student_id = int(input("Enter Student ID: "))
            book_id = int(input("Enter Book ID: "))
            deposit_book(connection, student_id, book_id)
        
        elif choice == '3':
            print("\n--- ADMINISTRATION MENU ---")
            print("1. CREATE STUDENT RECORD")
            print("2. DISPLAY ALL STUDENTS RECORD")
            print("3. CREATE BOOK RECORD")
            print("4. DISPLAY ALL BOOKS")
            admin_choice = input("Enter your choice: ")
            
            if admin_choice == '1':
                name = input("Enter Student Name: ")
                class_ = input("Enter Class: ")
                section = input("Enter Section: ")
                create_student(connection, name, class_, section)
            
            elif admin_choice == '2':
                display_all_students(connection)
            
            elif admin_choice == '3':
                title = input("Enter Book Title: ")
                author = input("Enter Book Author: ")
                create_book(connection, title, author)
            
            elif admin_choice == '4':
                display_all_books(connection)

        elif choice == '4':
            print(f"Thank you! Admin {admin_name}")
            break
        
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    while True:
        try:
            admin_name = input("Enter Admin Name: ")
            admin_name = validate_admin_name(admin_name)  # Validate admin name
            break  # Exit loop if name is valid
        except ValueError as e:
            print(e)  # Print error message and prompt again
    
    main_menu(admin_name)
