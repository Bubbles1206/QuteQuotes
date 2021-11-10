import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'package:provider/provider.dart';

import 'Views/ip_screen.dart';

void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (_) => QuoteListViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const int _blackPrimaryValue = 0xFF000000;
    const MaterialColor primaryBlack = MaterialColor(
      _blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(_blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: const IPInput(),
      // home: MyHomePage(ipAddress: "192.168.3.10"),
    );
  }
}
