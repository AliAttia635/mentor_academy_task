import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  String? hint;
  Function(String)? onChange;
  bool isPassword;
  Icon? prefixIcon;

  CustomFormTextField(
      {required this.hint,
      required this.onChange,
      required this.isPassword,
      this.prefixIcon});

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? !isObscure : isObscure,
      validator: (data) {
        if (data!.isEmpty) {
          return "this field is required";
        }
      },
      onChanged: widget.onChange,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: isObscure
                    ? Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : Icon(Icons.visibility_off, color: Colors.black))
            : null,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
