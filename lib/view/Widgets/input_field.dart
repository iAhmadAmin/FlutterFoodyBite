import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/icons.dart';

class InputField extends StatefulWidget {
  const InputField({
    @required this.hint,
    this.validator,
    @required this.controller,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  });

  final String hint;
  final Function validator;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator ??
          (val) {
            if (val.isEmpty || val == null)
              return 'Required';
            else
              return null;
          },
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.white,
          ),
      cursorColor: Colors.white,
      obscureText: widget.isPassword ? _hidePass : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.white,
            ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.25),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
