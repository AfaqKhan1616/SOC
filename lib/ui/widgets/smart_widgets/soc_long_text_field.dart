import 'package:flutter/material.dart';
import 'package:soc/utils/theme.dart';

class SocLongTextField extends StatefulWidget {
  final String? initialValue;
  final String? placeholder;
  final String? labelText;
  final String? errorText;
  final Function(String?)? onChangeText;
  final Function(String?)? validator;

  SocLongTextField({
    Key? key,
    this.initialValue,
    this.placeholder,
    this.labelText,
    this.errorText,
    this.onChangeText,
    this.validator,
  }) : super(key: key);

  @override
  State<SocLongTextField> createState() => _SocLongTextFieldState();
}

class _SocLongTextFieldState extends State<SocLongTextField> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.labelText ?? "",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: widget.errorText == null && value.isNotEmpty
                  ? Colors.green
                  : widget.errorText == null
                      ? Colors.black
                      : Colors.red,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: widget.initialValue,
          maxLines: 5,
          style: TextStyle(
              color: true ? Colors.green : Colors.red,
              fontStyle: FontStyle.italic),
          // obscureText: widget.isPassword && hidePassword,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: MyTheme.lightGrey),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.lightGrey,
                    //  width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.errorText == null && value.isNotEmpty
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
              errorText: widget.errorText),
          onChanged: (value) {
            this.value = value;
            if (widget.onChangeText != null) {
              widget.onChangeText!(value);
            }
            if (widget.validator != null) {
              widget.validator!(value);
            }
            setState(() {});
          },
        )
      ],
    );
  }
}
