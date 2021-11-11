import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote.dart';
import 'package:mvc_client/Services/http_requests.dart' as http;

class QuoteListViewModel extends ChangeNotifier {
  late List<QuoteViewModel> quotes = [];

  Future<void> fetchAllQuotes(String ipAddress, String port) async {
    final quotes = await http.getQuotes(ipAddress, port);
    this.quotes = quotes.map((quote) => QuoteViewModel(quote: quote)).toList();
    notifyListeners();
  }

  Future<void> addQuote(BuildContext context, Quote quote, String ip,
      String port, int lengthOfQuotes) async {
    http.addQuote(quote, ip, port, context, lengthOfQuotes);
    notifyListeners();
  }

  Future<void> deleteQuote(
      BuildContext context, Quote quote, String ip, String port) async {
    http.deleteQuote(quote, ip, port, context);
    notifyListeners();
  }

  void addToList(Quote quote) {
    quotes.add(QuoteViewModel(quote: quote));
    notifyListeners();
  }

  void removeFromList(Quote quote) {
    quotes.removeWhere((element) => element.quote.id == quote.id);
    notifyListeners();
  }
}

class QuoteViewModel {
  late final Quote quote;

  QuoteViewModel({required this.quote});

  String get quoteText {
    return quote.text;
  }

  String get quoteAuthor {
    return quote.name;
  }
}
