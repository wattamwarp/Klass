import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../../../../themes/colors.dart';
import '../../../../../../../themes/styles.dart';

class AddressField extends StatefulWidget {
  const AddressField({Key? key}) : super(key: key);

  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, state, child) => TextFormField(
        autocorrect: false,
        maxLines: 5,
        style: KStyles.inputText,
        cursorColor: KColors.primaryColor,
        cursorHeight: 15.0,
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Address",
          labelStyle: KStyles.lableStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: KColors.borderColor,
              width: 1.2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: KColors.borderColor,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
