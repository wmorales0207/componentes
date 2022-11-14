import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextEditingControllerPage extends StatefulWidget {
  const TextEditingControllerPage({super.key});
  static const route = 'TextEditingControllerPage';

  @override
  State<TextEditingControllerPage> createState() =>
      _TextEditingControllerPage();
}

class _TextEditingControllerPage extends State<TextEditingControllerPage> {
  final myController = TextEditingController();
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    // TODO: implement dispose
    super.dispose();
    myController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Form(
        // Build a Form widget using the _formKey created above.
        key: _formKey, // to valid forms
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (text) {
                  print('First Way text field: $text');
                },
              ),
              const Divider(
                height: 20,
              ),
              TextFormField(
                controller: myController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text that the user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }

  void _printLatestValue() {
    print('Second way text field: ${myController.text}');
  }
}
