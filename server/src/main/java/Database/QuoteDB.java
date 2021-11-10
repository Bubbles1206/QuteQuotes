package Database;

import Models.Quote;

import java.util.List;

public interface QuoteDB {
    /**
     * Get a single quote by id.
     * @param id the Id of the quote
     * @return a Quote
     */
    Quote get(Integer id);

    /**
     * Get all quotes in the database
     * @return A list of quotes
     */
    List<Quote> all();
}