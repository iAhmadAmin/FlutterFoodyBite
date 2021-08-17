import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodybite/constants/colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    @required this.hint,
    this.validator,
    @required this.controller,
    this.iconPath,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.isWhite = true,
    this.maxLines = 1,
  });

  final String hint, iconPath;
  final Function validator;
  final TextEditingController controller;
  final bool isPassword, isWhite;
  final TextInputType textInputType;
  final int maxLines;

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
            color: widget.isWhite ? Colors.white : Colors.black,
          ),
      maxLines: widget.maxLines,
      cursorColor: widget.isWhite ? Colors.white : Colors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? _hidePass : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
              color: widget.isWhite ? Colors.white : kSecondaryTextColor,
            ),
        prefixIcon: widget.iconPath != null
            ? Transform.scale(
                scale: 0.4,
                child: SvgPicture.asset(
                  widget.iconPath,
                  color: Colors.white,
                  height: 12,
                ),
              )
            : null,
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
        enabledBorder: OutlineInputBorder(
          borderSide: widget.isWhite
              ? BorderSide.none
              : BorderSide(
                  color: kSecondaryTextColor,
                ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.isWhite
              ? BorderSide.none
              : BorderSide(
                  color: kSecondaryTextColor,
                ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
