import 'package:flutter/material.dart';

class RegisterTextField extends StatefulWidget {
  final String? label, errorText, hint;
  final IconData? icon;
  final TextInputType? type;
  final ValueChanged<String>? onChange;
  final ValueChanged<String?>? onSaved;
  final bool? edit, enabled, visibility, readOnly;
  final Function? onChangeCountry, onInit;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? Function(String?)? validator;
  const RegisterTextField(
      {Key? key,
      this.readOnly,
      this.label,
      this.icon,
      this.type,
      this.hint,
      this.errorText,
      this.onChange,
      this.onSaved,
      this.edit,
      this.enabled,
      this.visibility,
      this.onChangeCountry,
      this.onInit,
      this.controller,
      this.validator,
      this.fillColor,
      })
      : super(key: key);

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Directionality(
        textDirection: true //localization.currentLanguage.toString() == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: TextFormField(
          readOnly: widget.readOnly ?? false,
          onSaved: widget.onSaved,
          controller: widget.controller,
          obscureText: widget.visibility == true ? visibility : false,
          enabled: widget.enabled ?? true,
          textAlign: TextAlign.right,
          keyboardType: widget.type,
          onFieldSubmitted: (v) {},
          onChanged: widget.onChange,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? Colors.white,
            prefixIcon: widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.all(0),
                    child: Icon(
                      widget.icon,
                      color: Colors.grey,
                    ),
                  )
                : null,
            suffixIcon: widget.edit == true
                ? const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.edit_outlined))
                : widget.visibility == true
                    ? Padding(
                        padding: const EdgeInsets.all(6),
                        child: IconButton(
                          icon: Icon(visibility
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                        ))
                    : null,
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            errorText: widget.errorText,
            hintText: widget.hint ?? '',
            floatingLabelBehavior: widget.hint != null
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.only(
              top: 10,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
