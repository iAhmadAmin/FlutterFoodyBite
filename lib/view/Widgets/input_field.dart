import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodybite/constants/colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    @required this.hint,
    this.validator,
    @required this.controller,
    @required this.iconPath,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  });

  final String hint, iconPath;
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? _hidePass : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
              color: Colors.white,
            ),
        prefixIcon: Transform.scale(
          scale: 0.4,
          child: SvgPicture.asset(
            widget.iconPath,
            color: Colors.white,
            height: 12,
          ),
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _hidePass = !_hidePass;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: !_hidePass ? kPrimaryColor : Colors.grey,
                ),
              )
            : null,
        filled: true,
        fillColor: kTextFieldColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
