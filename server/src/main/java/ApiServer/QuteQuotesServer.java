package ApiServer;

import io.javalin.Javalin;

import java.net.Inet4Address;
import java.net.UnknownHostException;

public class QuteQuotesServer {
    private final Javalin server;

    public QuteQuotesServer() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });

        this.server.get("/quotes", context -> QuteQuoteApiHandler.getAll(context));
//        this.server.get("/quote/{id}", context -> QuteQuoteApiHandler.getOne(context));
        this.server.post("/quotes", context -> QuteQuoteApiHandler.create(context));
        this.server.post("/remove", context -> QuteQuoteApiHandler.delete(context));
    }

    public static void main(String[] args) throws UnknownHostException {
        QuteQuotesServer server = new QuteQuotesServer();
        server.start(5000);
        System.out.println("Servers IP Address: " + Inet4Address.getLocalHost());
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }
}