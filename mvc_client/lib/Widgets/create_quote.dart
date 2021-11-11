import 'package:flutter/material.dart';
import 'package:mvc_client/Models/quote.dart';
import 'package:mvc_client/Models/quote_list_view_model.dart';
import 'package:provider/provider.dart';

class CreateQuote extends StatefulWidget {
  final String ipAddress;
  final String port;
  final int numberOfQuotes;
  const CreateQuote({Key? key, required this.ipAddress, required this.port, required this.numberOfQuotes})
      : super(key: key);

  @override
  _CreateQuoteState createState() => _CreateQuoteState();
}

class _CreateQuoteState extends State<CreateQuote> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerAuthor = TextEditingController();
  late Quote _quote;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: 400,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Add Quote", style: TextStyle(fontSize: 20)),
                    SizedBox(width: MediaQuery.of(context).size.width / 6),
                    IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                hintText: "Enter Quote here"),
                            controller: _controller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the Quote!';
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 2,
                            decoration: const InputDecoration(
                                hintText: "Enter Author Name here"),
                            controller: _controllerAuthor,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the authors name!';
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _quote = Quote(
                          id: widget.numberOfQuotes + 1,
                          text: _controller.value.text,
                          name: _controllerAuthor.value.text);
                      Provider.of<QuoteListViewModel>(context, listen: false)
                          .addQuote(
                        context,
                        _quote,
                        widget.ipAddress,
                        widget.port,
                        widget.numberOfQuotes
                      );
                      Navigator.pop(context);
                      // print("Submitting quote");
                    }
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
