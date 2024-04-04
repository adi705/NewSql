import random
import string
import datetime
import time
import volt

RECORD_COUNT = 100  # Change this value as needed

# Establish connection to VoltDB
client = volt.Client("localhost")

# Function to generate random string
def random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Function to generate random email
def random_email():
    return f"{random_string(8)}@example.com"

# Function to generate random address
def random_address():
    return f"{random_string(10)}, {random_string(8)}, {random_string(5)}, {random_string(2)}"

# Function to generate random timestamp within a range
def random_timestamp(start_date, end_date):
    return start_date + datetime.timedelta(seconds=random.randint(0, int((end_date - start_date).total_seconds())))

# Generate and insert records into Customers table
for i in range(1, RECORD_COUNT + 1):
    client.call_procedure("InsertCustomerProc", (i, random_string(8), random_string(8), random_email(), random_address()))

# Generate and insert records into Products table
for i in range(1, RECORD_COUNT + 1):
    client.call_procedure("InsertProductProc", (i, random_string(10), random_string(20), round(random.uniform(1, 1000), 2)))

# Generate and insert records into Orders table
start_date = datetime.datetime(2022, 1, 1)
end_date = datetime.datetime(2022, 12, 31)
for i in range(1, RECORD_COUNT + 1):
    client.call_procedure("InsertOrderProc", (i, random.randint(1, RECORD_COUNT), random_timestamp(start_date, end_date)))

# Generate and insert records into Order_Details table
for i in range(1, RECORD_COUNT + 1):
    client.call_procedure("InsertOrderDetailProc", (i, random.randint(1, RECORD_COUNT), random.randint(1, RECORD_COUNT), random.randint(1, 10)))

print("Data insertion completed.")
