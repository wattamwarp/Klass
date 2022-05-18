import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_klass/helper/validators.dart';
import 'package:flutter_app_klass/themes/themes.dart';



class KTextField extends StatelessWidget {
  ///[hintText] to define the hint text in `TextField`
  final String? hintText;

  ///[labelText] to display the label text in `TextField`
  final String? labelText;

  ///[lableStyle] is if there is any change to label style
  ///if `null` it will merge empty `TextStyle`
  final TextStyle? labelStyle;

  final TextEditingController? controller;

  final ChoiceEnum choice;

  final TextInputAction textInputAction;

  final Function(String)? onChanged;

  final bool isEnabled;

  final String? icon; //TODO: CHANGE IT TO SVG

  const KTextField({
    Key? key,
    required this.choice,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.isEnabled = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: isEnabled ? Colors.white : KColors.secondaryColor,
          border: Border.all(
            width: 1.2,
            color: isEnabled ? KColors.borderColor : KColors.secondaryColor,
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                color: KColors.activeTextColor,
              )
            else
              const SizedBox(),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextFormField(
                autocorrect: false,
                enabled: isEnabled,
                controller: controller,
                style: KStyles.inputText,
                cursorColor: KColors.primaryColor,
                cursorHeight: 15.0,
                keyboardType: getKeyboardType(choice),
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  hintText: hintText ?? "",
                  labelText: labelText ?? "",
                  labelStyle:
                      KStyles.lableStyle.merge(labelStyle ?? const TextStyle()),
                  border: InputBorder.none,
                ),
                onTap: () {},
                onChanged: onChanged,
                validator: validators(choice, context),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        ));
  }

  TextInputType getKeyboardType(ChoiceEnum choice) {
    switch (choice) {
      case ChoiceEnum.name:
        return TextInputType.text;
      case ChoiceEnum.age:
        return const TextInputType.numberWithOptions();
      case ChoiceEnum.email:
        return TextInputType.emailAddress;
      case ChoiceEnum.password:
        return TextInputType.visiblePassword;
      case ChoiceEnum.confirmPassword:
        return TextInputType.visiblePassword;
      case ChoiceEnum.phone:
        return TextInputType.phone;
      case ChoiceEnum.reset:
        return TextInputType.emailAddress;
      case ChoiceEnum.address:
        return TextInputType.streetAddress;
      default:
        return TextInputType.text;
    }
  }

  String? Function(String?) validators(
      ChoiceEnum? choice, BuildContext? context) {
    return KValidators.buildValidators(context!, choice!);
  }
}

enum ChoiceEnum {
  name,
  email,
  phone,
  password,
  confirmPassword,
  reset,
  text,
  optionalText,
  age,
  address
}
