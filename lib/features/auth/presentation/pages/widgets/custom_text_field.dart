import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String label;
  final bool isObsecure;
  final IconData ?icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
final void Function()?onPressedIcon;
  const CustomTextFormFieldWidget({
    super.key,
    required this.label,
    this.isObsecure = false, this.icon, required this.controller, required this.validator,  this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
controller:controller ,
validator:validator ,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(onPressed: onPressedIcon, icon: Icon(icon)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
