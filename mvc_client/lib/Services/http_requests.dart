import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:mvc_client/Models/quote.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'package:provider/provider.dart';

Future<List<Quote>> getQuotes(String ip, String port) async {
  var uri = Uri.parse("http://" + ip + ":" + port + "/quotes");
  List<Quote> quotes = [];

  Response res = await get(uri);

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    quotes = body.map((dynamic item) => Quote.fromJson(item)).toList();
    return quotes;
  } else {
    throw "Can't get quotes";
  }
}

Future<void> addQuote(Quote quote, String ip, String port, BuildContext context, int quotes) async {
  var uri = Uri.parse("http://" + ip + ":" + port + "/quotes");
  int newQuote = quotes + 1;
  Response res = await post(uri,
      body: "{\"id\": $newQuote,\"name\": \"${quote.name}\", \"text\": \"${quote.text}\"}");
  print(res);
  print(res.body);
  if (res.statusCode == 201) {
    Provider.of<QuoteListViewModel>(context, listen: false).addToList(quote);
  } else {
    throw "Error adding quote";
  }
}

Map toMap(String name, String text) {
  var map = {};
  map["name"] = name;
  map["text"] = text;

  return map;
}
