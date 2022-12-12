import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/**
 * For the reactive form version, there are several ways of creating a Form.
 *  This article will use a simple one, but you can read the package documentation to find and try the others.

    In reactive forms “A form is composed of multiple fields or controls.”. A FormGroup
     is the main component for creating forms. It can contain FormControls but also can include
      more complex structures such as FormArrays or other nested FormControls. 
 */

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  /// Validates that control's value must be `true`
  Map<String, dynamic>? _requiredTrue(AbstractControl<dynamic> control) {
    return control.isNotNull && control.value is bool && control.value == true
        ? null
        : {'requiredTrue': true};
  }

// aply custom validators
  final americanExpressCardPattern = r'^3[47][0-9]{13}$';
  final cardNumber = FormControl<String>(
    validators: [Validators.pattern(RegExp(r'^3[47][0-9]{13}$'))],
  );

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'passwordConfirmation': FormControl<String>(),
  }, validators: [
    // we can use the Validatores Methods
    Validators.mustMatch('password', 'passwordConfirmation')
  ]);

// example of a valid iplementation
  ValidatorFunction _mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'mustMatch': true});

        // force messages to show up as soon as possible
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('mustMatch');
      }

      return null;
    };
  }

// the the value of a field
  String get name => _form.control('termsAccepted').value;

  /**Asynchronous Validators 
  * 
  Some times you want to perform a validation against a remote server, this operations are more time consuming
   and need to be done asynchronously.

For example you want to validate that the email the user is currently typing in a registration form
 is unique and is not already used in your application. Asynchronous Validators are just another tool so use it wisely.

Asynchronous Validators are very similar to their synchronous counterparts, with the following difference:

    The validator function returns a Future

  */

  final form1 = FormGroup({
    'email': FormControl<String>(
      validators: [
        Validators.required, // traditional required and email validators
        Validators.email,
      ],
      //asyncValidators: [_uniqueEmail], // custom asynchronous validator :)
    ),
  });

// just a simple array to simulate a database of emails in a server
  var inUseEmails = ['johndoe@email.com', 'john@email.com'];

  /// Async validator example that simulates a request to a server
  /// and validates if the email of the user is unique.
  Future<Map<String, dynamic>> _uniqueEmail(
      AbstractControl<dynamic> control) async {
    final error = {'unique': false};

    final emailAlreadyUsed = await Future.delayed(
      const Duration(
          seconds: 5), // a delay to simulate a time consuming operation
      () => inUseEmails.contains(control.value),
    );

    if (emailAlreadyUsed) {
      control.markAsTouched();
      //Note the use of control.markAsTouched() to force the validation message to show up as soon as possible.
      return error;
    }

    return {'unique': true};
  }

////////////////////////////////
  ///

  final _form = FormGroup({
    'nickname': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        Validators.pattern(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$'),
      ],
    ),
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'comment': FormControl<String>(),
    'radio': FormControl<bool>(
      validators: [
        Validators.requiredTrue,
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Form Example'),
      ),
      body: ReactiveForm(
        formGroup: _form,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReactiveTextField<String>(
                  key: const Key('nickname'),
                  formControlName: 'nickname',
                  decoration: const InputDecoration(
                    label: Text('Nickname'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validationMessages: {
                    ValidationMessage.required: (error) => error.toString(),
                    ValidationMessage.minLength: (error) =>
                        'Field must be at least 3 characters long',
                    ValidationMessage.pattern: (error) => 'invalid characters',
                  },
                  maxLength: 16,
                ),
                ReactiveTextField<String>(
                  key: const Key('email'),
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validationMessages: {
                    ValidationMessage.required: (error) =>
                        'Please enter some text',
                    ValidationMessage.email: (error) =>
                        'Incorrect pattern: invalid email',
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveTextField<String>(
                  key: const Key('comment'),
                  formControlName: 'comment',
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  minLines: 5,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveCheckboxListTile(
                  key: const Key('radio'),
                  formControlName: 'radio',
                  title: const Text('Accept terms and conditions'),
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => ElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(' nik: ${form.value} '),
                            backgroundColor: Colors.greenAccent,
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
