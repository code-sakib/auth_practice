import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  static String _currentText = '';

  String get text => _currentText;

  set setText(String newText) {
    _currentText = newText;
  }

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isObscure = true;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: TextFormField(
          controller: _textEditingController,
          onChanged: (value) {
            widget.setText = value;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: ((email) => email != null &&
                  !EmailValidator.validate(email) &&
                  email.length > 3
              ? 'Enter a valid Email'
              : null),
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          )),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  static String _currentText = '';

  String get text => _currentText;

  set setText(String newText) {
    _currentText = newText;
  }

  @override
  State<PasswordTextField> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: TextField(
          controller: _textEditingController,
          onChanged: (value) {
            widget.setText = value;
          },
          obscureText: isObscure,
          decoration: InputDecoration(
              labelText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              suffixIcon: IconButton(
                  onPressed: () => toObscure(),
                  icon: Icon(isObscure
                      ? Icons.visibility
                      : Icons.visibility_off_rounded)))),
    );
  }

  toObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }
}

class PhoneNumberTF extends StatefulWidget {
  const PhoneNumberTF({
    Key? key,
  }) : super(key: key);

  static String _currentText = '';

  String get text => _currentText;

  set setText(String newText) {
    _currentText = newText;
  }

  @override
  State<PhoneNumberTF> createState() => _PhoneNumberTF();
}

class _PhoneNumberTF extends State<PhoneNumberTF> {
  bool isObscure = true;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: TextFormField(
          controller: _textEditingController,
          onChanged: (value) {
            widget.setText = value;
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          )),
    );
  }
}
