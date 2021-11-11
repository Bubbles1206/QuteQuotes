import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class DisplayQuote extends StatelessWidget {
  final Quote quote;
  final String ipAdress;
  final String port;

  // final Quote quote;
  const DisplayQuote({Key? key, required this.quote, required this.ipAdress, required this.port}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QuteQuotes"),
      ),
      body: Stack(fit: StackFit.expand, children: [
        generateQuoteBackground(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    //The line below curves the corners of the box
                    borderRadius: BorderRadius.circular(10.0),
                    // The line below is for rectangular shape
                    shape: BoxShape.rectangle,
                    // Below is just the colour of the box with an opacity added.
                    //you can change opacity with color here(I used black) for the box
                    color: Colors.black.withOpacity(0.5),
                    // below is just to adda shadow to the box
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Text("\"",
                      //     style: GoogleFonts.lato(
                      //         textStyle: Theme.of(context).textTheme.headline4,
                      //         fontSize: 75,
                      //         fontWeight: FontWeight.w700,
                      //         color: Colors.white
                      //     )),
                      Text(
                        quote.text,
                        // style: const TextStyle(fontSize: 20)
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      // Text("\"",
                      //     style: GoogleFonts.lato(
                      //         textStyle: Theme.of(context).textTheme.headline4,
                      //         fontSize: 75,
                      //         fontWeight: FontWeight.w700,
                      //         color: Colors.white
                      //     )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("- " + quote.name,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: MaterialButton(
                  color: Colors.red.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  child: const Text("Delete",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  onPressed: () {
                    Provider.of<QuoteListViewModel>(context, listen: false)
                        .deleteQuote(context, quote, ipAdress, port);
                    Navigator.pop(context);
                    // print(quote);
                    // print(quote.text);
                    // print(quote.name);
                    // print(quote.id);
                  },
                ),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: MaterialButton(
                  color: Colors.black.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  child: const Text("Close",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  onPressed: () {
                    Navigator.pop(context);
                    // print(quote);
                    // print(quote.text);
                    // print(quote.name);
                    // print(quote.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget generateQuoteBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/look.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      //I blurred the parent container to blur background image, you can get rid of this part
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          //you can change opacity with color here(I used black) for background.
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }
}
