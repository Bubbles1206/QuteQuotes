package ApiTest;

import Models.Quote;
import ApiServer.QuteQuotesServer;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import kong.unirest.UnirestException;
import kong.unirest.json.JSONArray;
import org.junit.jupiter.api.*;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class QuoteApiTests {
    private static QuteQuotesServer server;

    @BeforeAll
    public static void startServer() {
        server = new QuteQuotesServer();
        server.start(5000);
    }

    @AfterAll
    public static void stopServer() {
        server.stop();
    }

    @Test
    @DisplayName("GET /quotes")
    void getAllQuotes() throws UnirestException {
        HttpResponse<JsonNode> response = Unirest.get("http://localhost:5000/quotes").asJson();
        assertEquals(200, response.getStatus());
        assertEquals("application/json", response.getHeaders().getFirst("Content-Type"));

        JSONArray jsonArray = response.getBody().getArray();
        assertTrue(jsonArray.length() > 1);
    }

    @Test
    @DisplayName("POST /quotes")
    void create() throws UnirestException {
        HttpResponse<JsonNode> response = Unirest.post("http://localhost:5000/quotes")
                .header("Content-Type", "application/json")
                .body(Quote.create("Meow", "The Cat"))
                .asJson();
        assertEquals(201, response.getStatus());
//        assertEquals("/quote/4", response.getHeaders().getFirst("Location"));

        response = Unirest.get("http://localhost:5000/quotes").asJson();
        assertEquals(200, response.getStatus());
    }
}