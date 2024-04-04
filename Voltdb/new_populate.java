import org.voltdb.client.Client;
import org.voltdb.client.ClientFactory;

import java.util.Random;

public class DataPopulator {

    private static final int RECORD_COUNT = 100; // Change this value as needed

    public static void main(String[] args) {
        // Create a VoltDB client instance
        Client client = ClientFactory.createClient();

        // Initialize the client and connect to the VoltDB server
        try {
            client.createConnection("localhost");
            client.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Generate and insert records into Customers table
        for (long i = 1; i <= RECORD_COUNT; i++) {
            String firstName = generateRandomString(8);
            String lastName = generateRandomString(8);
            String email = generateRandomEmail();
            String address = generateRandomAddress();

            try {
                client.callProcedure("InsertCustomerProc", i, firstName, lastName, email, address);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Generate and insert records into Products table
        Random random = new Random();
        for (long i = 1; i <= RECORD_COUNT; i++) {
            String name = generateRandomString(10);
            String description = generateRandomString(20);
            double price = random.nextDouble() * 1000; // Random price between 0 and 1000

            try {
                client.callProcedure("InsertProductProc", i, name, description, price);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Generate and insert records into Orders table
        for (long i = 1; i <= RECORD_COUNT; i++) {
            long customerId = random.nextInt(RECORD_COUNT) + 1; // Random customer ID between 1 and RECORD_COUNT
            long timestamp = System.currentTimeMillis() - random.nextInt(31536000000) + 1577836800000L; // Random timestamp within last 10 years

            try {
                client.callProcedure("InsertOrderProc", i, customerId, timestamp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Generate and insert records into Order_Details table
        for (long i = 1; i <= RECORD_COUNT; i++) {
            long orderId = random.nextInt(RECORD_COUNT) + 1; // Random order ID between 1 and RECORD_COUNT
            long productId = random.nextInt(RECORD_COUNT) + 1; // Random product ID between 1 and RECORD_COUNT
            int quantity = random.nextInt(10) + 1; // Random quantity between 1 and 10

            try {
                client.callProcedure("InsertOrderDetailProc", i, orderId, productId, quantity);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Disconnect from the VoltDB server
        try {
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Data insertion completed.");
    }

    // Helper method to generate a random string
    private static String generateRandomString(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }

    // Helper method to generate a random email address
    private static String generateRandomEmail() {
        return generateRandomString(8) + "@example.com";
    }

    // Helper method to generate a random address
    private static String generateRandomAddress() {
        return generateRandomString(10) + ", " + generateRandomString(8) + ", " + generateRandomString(5) + ", " + generateRandomString(2);
    }
}
