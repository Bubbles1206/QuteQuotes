import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'package:mvc_client/Views/display_quote_screen.dart';

// ignore: must_be_immutable
class QuoteList extends StatelessWidget {
  late List<QuoteViewModel> quotes;

  QuoteList({Key? key, required this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (BuildContext context, int index) {
          final quote = quotes[index];

          return ListTile(
            title: Text(quote.quoteText),
            subtitle: Text(quote.quoteAuthor),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayQuote(quote: quote.quote)));
            },
          );
        });
  }
}
