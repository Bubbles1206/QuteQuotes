package Database;

import Models.Quote;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SQL_Management{

    private static final String CONN = "jdbc:sqlite:QuoteDataBaseSQL.db";

    private static Connection connect() {

        Connection conn = null;
        if(isSuitableDriverAvailable()) {
            try {
                conn = DriverManager.getConnection(CONN);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            System.err.println("The driver was not correctly loaded and execution was aborted");
        }
        return conn;
    }

    private static boolean isSuitableDriverAvailable() {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch(ClassNotFoundException ex) {
            return false;
        }

        return true;
    }

    public static List<Quote> getQuotes(){
        String sql = "SELECT * FROM Quotes";
        List<Quote> quoteList = new ArrayList<>();
        Quote newQuote = new Quote();
        Quote addQuote;

        try (Connection conn = connect();
             Statement stmt  = conn.createStatement();
             ResultSet rs    = stmt.executeQuery(sql)){

            // loop through the result set
            while (rs.next()) {
                newQuote.setId(rs.getInt("ID"));
                newQuote.setName(rs.getString("Name"));
                newQuote.setText(rs.getString("Text"));
                addQuote = newQuote;
                newQuote = new Quote();
                quoteList.add(addQuote);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return quoteList;
    }

    public static void insert(String name, String text) {

        String sql2 = "INSERT INTO Quotes (\n" +
                "                       Name,\n" +
                "                       Text\n" +
                "                   )\n" +
                "                   VALUES (\n" +
                "                       ?,\n" +
                "                       ?\n" +
                "                   );\n";

        try (Connection conn = connect();
             PreparedStatement preSTMT = conn.prepareStatement(sql2)){
            preSTMT.setString(1, name);
            preSTMT.setString(2, text);
            preSTMT.executeUpdate();
        } catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
    }


    public static List<Quote> all() {
        return getQuotes();
    }

    public static Quote add(Quote quote) {
        insert(quote.getName(), quote.getText());
        return quote;
    }
}
