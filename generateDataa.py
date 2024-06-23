from datetime import datetime
from faker import Faker
import random

import csv

fake = Faker()
#
# Generate data for Reader table
reader = ''
for i in range(200000):
    reader += f"INSERT INTO \"Reader\" (\"ReaderID\", \"Name\")\n\
                   VALUES ({i}, '{fake.name()}');\n\n"

with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Reader.sql", "w") as file:
    file.write(reader)
#
#
FamilyData = ''
Families = []
for i in range(100000):
    FamilyID = random.randint(1, 100000000)
    while FamilyID in Families:  # Check if the ID already exists
        FamilyID = random.randint(1, 100000000)  # Generate a new ID
    Families.append(FamilyID)
    phone_number = fake.numerify("1-###-###-####")
    FamilyData += f"INSERT INTO \"Family\" (\"FamilyPhone\", \"FamilyEmail\", \"FamilyID\")\n\
                    VALUES ('{phone_number}', '{fake.email()}', {FamilyID});\n\n"
with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Family.sql", "w") as file:
    file.write(FamilyData)
# #
AdultData = ''
for i in range(1,100000):
    FamID = random.choice(Families)
    phone_number = fake.numerify("1-###-###-####")
    AdultData += f"INSERT INTO \"Adult\" (\"Email\", \"Cellphone\", \"Occupation\", \"ReaderID\", \"FamilyID\")\n\
                    VALUES ('{fake.email()}', '{phone_number}', '{fake.job()}', {i}, {FamID});\n\n"
with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Adult.sql", "w") as file:
    file.write(AdultData)
print(AdultData)
# #
ChildData = ''
for i in range(100001,150000):
    FamID = random.choice(Families)
    Age = random.randint(1,18)
    ChildData += f"INSERT INTO \"Child\" (\"Age\", \"ReaderID\", \"FamilyID\")\n\
                    VALUES ('{Age}', {i}, {FamID});\n\n"
with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Child.sql", "w") as file:
    file.write(ChildData)
# #
# #
# #
student_data = ''
for i in range(150001,199999):
    studID = random.randint(10000,100000000)
    inst = random.choice(['school', 'university', 'other'])
    student_data += f"INSERT INTO \"Student\" (\"ReaderID\", \"StudentID\", \"Institution\", \"StudEmail\")\n\
                         VALUES ({i}, '{studID}', '{inst}', '{fake.email()}');\n\n"

with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Student.sql", "w") as file:
     file.write(student_data)
#
#
# Generate data for Book table
book_data = ''
for i in range(100000,300000):
    book_data += f"INSERT INTO \"Book\" (\"BookID\", \"Title\", \"Author\", \"ISBN\")\n\
            VALUES ({i}, '{fake.catch_phrase()}', '{fake.name()}', {fake.isbn13()});\n\n"

with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Book.sql", "w") as file:
    file.write(book_data)

# Generate data for Loan table
# Generate a random date between the start date and today
loan_data = ''
for i in range(200000):
    bookID = random.randint(100000, 299999)
    readerID = random.randint(0, 199999)
    transactionID = i
    borrowDate = fake.date_between(start_date='-30d', end_date='today')
    dueDate = fake.date_between(start_date='today', end_date='+30d')
    loan_data += f"INSERT INTO \"Loan\" (\"BookID\", \"ReaderID\", \"TransactionID\", \"BorrowDate\", \"DueDate\")\n\
                              VALUES ({bookID}, {readerID}, {transactionID}, '{borrowDate}', '{dueDate}');\n\n"

with open(r"C:\Users\shlom\OneDrive\Desktop\ReadersDB\Loan.sql", "w") as file:
    file.write(loan_data)
