import 'package:flutter/material.dart';

class FlutterFormExample extends StatefulWidget {
  const FlutterFormExample({super.key});

  @override
  createState() => _FlutterFormExampleState();
}

class _FlutterFormExampleState extends State<FlutterFormExample> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _nickname = TextEditingController();
  final _email = TextEditingController();
  final _comment = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Example'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nickname,
                  key: const Key("nickname"),
                  decoration: const InputDecoration(
                    label: Text('Nickname'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 3) {
                      return 'Field must be at least 3 characters long';
                    }
                    final pattern = RegExp(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$');
                    if (!pattern.hasMatch(value)) {
                      return 'Incorrect pattern: invalid characters';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 16,
                ),
                TextFormField(
                  key: const Key("email"),
                  controller: _email,
                  
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                    
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    final pattern = RegExp(r'.+\@.+\..+');
                    if (!pattern.hasMatch(value)) {
                      return 'Incorrect pattern: invalid email';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const Key("comment"),
                  controller: _comment,
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  minLines: 5,
                  maxLines: 5,
                  maxLength: 120,
                ),
                FormField<bool>(
                  validator: (value) {
                    if (value == null || value == false) {
                      return 'This is required';
                    }
                    return null;
                  },
                  initialValue: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  builder: (field) => CheckboxListTile(
                    key: const Key('termsAccepted'),
                    title: const Text('Accept terms and conditions'),
                    dense: field.hasError,
                    onChanged: field.didChange,
                    value: field.value,
                  ),
                ),
                ElevatedButton(
                  key: const Key('submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              ' nik: ${_nickname.text} , email: ${_email.text}, comment: ${_comment.text}'),
                          backgroundColor: Colors.greenAccent,
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
