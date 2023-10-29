import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sks/helper/app_export.dart';
import 'package:sks/helper/app_style.dart';

class LoginTextFormFieldWidget extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputType keyboardType;

  const LoginTextFormFieldWidget({
    Key? key,
    this.hint,
    this.label,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.validator,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorConstant.whiteA700),
    );
    return TextFormField(
      autovalidateMode: focusNode.hasFocus
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      style: AppStyle.txtRobotoRomanMedium18Gray90090(context)
          .copyWith(color: ColorConstant.whiteA700),
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: UIhelper.paddingHelper(context,
            top: 0, bottom: 0, right: 0, left: 19),
        // alignLabelWithHint: true,
        filled: true,
        fillColor: ColorConstant.black900.withOpacity(0.3),
        hintText: hint,
        labelText: label,
        // label: Text(hint),
        hintStyle: AppStyle.txtRobotoRomanMedium18Gray90090(context)
            .copyWith(color: ColorConstant.whiteA700.withOpacity(.5)),
        labelStyle: AppStyle.txtRobotoRomanMedium18Gray90090(context)
            .copyWith(color: ColorConstant.whiteA700.withOpacity(.9)),
        errorBorder: outlineInputBorder.copyWith(
            borderSide: BorderSide(color: ColorConstant.red50)),
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        // errorStyle: TextStyle(
        //   color: ColorConstant.red50,
        // ),
      ),
    );
  }
}
