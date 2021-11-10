import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'package:mvc_client/Widgets/create_quote.dart';
import 'package:mvc_client/Widgets/quote_list.dart';
import 'package:provider/provider.dart';

class QuoteListScreen extends StatefulWidget {
  final String ipAddress;
  final String port;
  const QuoteListScreen({Key? key, required this.ipAddress, required this.port})
      : super(key: key);

  @override
  _QuoteListScreenState createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuoteListViewModel>(context, listen: false)
        .fetchAllQuotes(widget.ipAddress, widget.port);
  }

  Widget _buildUI(QuoteListViewModel viewModel) {
    if (viewModel.quotes.isEmpty) {
      return const Align(child: Text("No Quotes Found"));
    } else {
      return QuoteList(quotes: viewModel.quotes);
    }
  }

  void _addQuoteButton(int quotes) {
    showDialog(
        context: context,
        builder: (BuildContext build) =>
            CreateQuote(ipAddress: widget.ipAddress, port: widget.port, numberOfQuotes: quotes));
  }

  @override
  Widget build(BuildContext context) {
    QuoteListViewModel viewModel = Provider.of<QuoteListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("QuteQuotes"),
      ),
      // body: _buildUI(viewModel),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/2961907.webp"), fit: BoxFit.cover,),
            ),
          ),
          _buildUI(viewModel)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addQuoteButton(viewModel.quotes.length),
        tooltip: 'Add Quote',
        child: const Icon(Icons.add),
      ),
    );
    // body: const Text("Quotes will be displayed here"));
  }
}
