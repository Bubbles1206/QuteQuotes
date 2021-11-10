import 'package:flutter/material.dart';
import 'package:mvc_client/Views/quote_list_screen.dart';

class IPInput extends StatefulWidget {
  const IPInput({Key? key}) : super(key: key);

  @override
  _IPInputState createState() => _IPInputState();
}

class _IPInputState extends State<IPInput> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerPort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("QuteQuotes"),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: 200,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                decoration:
                    const InputDecoration(hintText: "Enter IP Address here"),
                controller: _controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text in the form!';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                decoration: const InputDecoration(hintText: "Enter Port here"),
                controller: _controllerPort,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text in the form!';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuoteListScreen(
                              ipAddress: _controller.value.text,
                              port: _controllerPort.value.text)));
                },
                child: const Text("Submit IP and Port")),
          ],
        ),
      ),
    );
  }
}
