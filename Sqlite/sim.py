import sqlite3
import random
import time

# Connect to the SQLite database
conn = sqlite3.connect('test.db')
cursor = conn.cursor()

# Function to simulate user interactions and measure performance
def simulate_user_interaction():
    start_time = time.time()  # Record the start time

    # Read operation: Retrieve product details
    product_id = random.randint(1, 1000000)  # Assuming there are 1,000,000 products
    cursor.execute("SELECT * FROM Products WHERE ProductID = ?", (product_id,))
    #print("Product details:", cursor.fetchone())

    # Write operation: Add a new order
    customer_id = random.randint(1, 1000000)  # Assuming there are 1,000,000 customers
    cursor.execute("INSERT INTO Orders (CustomerID, OrderDate) VALUES (?, DATE('now'))", (customer_id,))
    conn.commit()  # Commit the transaction

    # Read operation: Retrieve order details
    order_id = cursor.lastrowid  # Get the ID of the last inserted row
    cursor.execute("SELECT * FROM Orders WHERE OrderID = ?", (order_id,))
    #print("Order details:", cursor.fetchone())

    end_time = time.time()  # Record the end time
    transaction_time = end_time - start_time  # Calculate transaction time
    return transaction_time

# Measure performance parameters
total_transactions = 100000  # Total number of transactions to simulate 
total_time = 0.0  # Total time taken for all transactions
for i in range(total_transactions):
    transaction_time = simulate_user_interaction()
    total_time += transaction_time

# Calculate throughput and latency
throughput = total_transactions / total_time
#latency = total_time / total_transactions
latency = total_time 

print("Throughput: {:.2f} transactions/second".format(throughput))
print("Latency: {:.4f} seconds".format(latency))

# Close the connection
conn.close()
