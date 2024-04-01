import org.voltdb.*;
import java.util.Random;

public class VoltDBSimulation {

    public static void main(String[] args) throws Exception {
        // Create client instance and connect to VoltDB
        org.voltdb.client.Client client = ClientFactory.createClient();
        client.createConnection("localhost");

        // Total number of transactions to simulate
        int totalTransactions = 100000;

        // Track total time taken for all transactions
        long totalTime = 0;

        // Perform transactions
        for (int i = 0; i < totalTransactions; i++) {
            long transactionTime = simulateUserInteraction(client);
            totalTime += transactionTime;
        }

        // Calculate throughput and latency
        double throughput = totalTransactions / (totalTime / 1000.0); // Transactions per second
        double latency = totalTime / (double) totalTransactions; // Average latency in milliseconds

        // Print results
        System.out.println("Throughput: " + throughput + " transactions/second");
        System.out.println("Latency: " + latency + " milliseconds");

        // Close the client connection
        client.close();
    }

    // Function to simulate user interactions and measure performance
    private static long simulateUserInteraction(org.voltdb.client.Client client) throws Exception {
        long startTime = System.currentTimeMillis(); // Record the start time

        // Read operation: Retrieve product details
        long productId = new Random().nextInt(1000000) + 1; // Assuming there are 1,000,000 products
        client.callProcedure("Products.select", productId);

        // Write operation: Add a new order
        long customerId = new Random().nextInt(1000000) + 1; // Assuming there are 1,000,000 customers
        client.callProcedure("Orders.insert", customerId, System.currentTimeMillis());

        // Read operation: Retrieve order details
        client.callProcedure("Orders.selectLastRow");

        long endTime = System.currentTimeMillis(); // Record the end time
        return endTime - startTime; // Calculate transaction time
    }
}
