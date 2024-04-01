import org.voltdb.client.Client;
import org.voltdb.client.ClientFactory;
import org.voltdb.client.ProcCallException;
import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

public class PopulateVoltDBTables {

    public static void main(String[] args) {
        // Initialize VoltDB client
        Client client = ClientFactory.createClient();

        // Connect to the VoltDB server
        try {
            client.createConnection("localhost");
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        // Populate Customers table
        try {
            for (int n = 1; n <= 5000000; n++) {
                client.callProcedure("Customers.insert",
                        n,
                        "FirstName" + n,
                        "LastName" + n,
                        "email" + n + "@example.com",
                        "Address" + n);
            }
        } catch (ProcCallException e) {
            e.printStackTrace();
        }

        // Populate Products table
        try {
            for (int n = 1; n <= 5000000; n++) {
                client.callProcedure("Products.insert",
                        n,
                        "Product" + n,
                        "Description of Product" + n,
                        ThreadLocalRandom.current().nextDouble(1000));
            }
        } catch (ProcCallException e) {
            e.printStackTrace();
        }

        // Populate Orders table
        try {
            for (int n = 1; n <= 5000000; n++) {
                client.callProcedure("Orders.insert",
                        n,
                        ThreadLocalRandom.current().nextLong(5000000),
                        "SUBTRACT_SECONDS(now, " + ThreadLocalRandom.current().nextInt(365 * 24 * 60 * 60) + ")");
            }
        } catch (ProcCallException e) {
            e.printStackTrace();
        }

        // Populate Order_Details table
        try {
            for (int n = 1; n <= 5000000; n++) {
                client.callProcedure("Order_Details.insert",
                        n,
                        ThreadLocalRandom.current().nextLong(5000000),
                        ThreadLocalRandom.current().nextLong(5000000),
                        ThreadLocalRandom.current().nextInt(1, 11));
            }
        } catch (ProcCallException e) {
            e.printStackTrace();
        }

        // Close the VoltDB connection
        client.close();
    }
}
