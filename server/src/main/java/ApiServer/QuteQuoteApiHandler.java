package ApiServer;

import Database.SQL_Management;
import Models.Quote;
import io.javalin.http.Context;
import io.javalin.http.HttpCode;

import java.util.List;

public class QuteQuoteApiHandler {
//    private static final QuoteDB database = new TestDatabase();

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        System.out.println(context.body());
        List<Quote> quotes = SQL_Management.all();
        context.json(quotes);
    }

    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void create(Context context) {
//        System.out.println(context.body());
        Quote quote = context.bodyAsClass(Quote.class);
        Quote newQuote = SQL_Management.add(quote);
        context.header("Location", "/quote/" + newQuote.getId());
        context.status(HttpCode.CREATED);
        context.json(newQuote);
    }

    /**
     * delete an existing quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void delete(Context context) {
        //        System.out.println(context.body());
                Quote quote = context.bodyAsClass(Quote.class);
                SQL_Management.remove(quote);
                context.status(HttpCode.ACCEPTED);
                context.json("Quote has been deleted");
            }
}