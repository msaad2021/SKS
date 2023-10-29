import 'package:sks/helper/app_export.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final bool enabled;
  final int manxLines;
  final Widget? icon;
  final double padding;

  const TextFormFieldWidget({
    Key? key,
    this.hint,
    this.label,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.manxLines = 1,
    this.icon,
    this.padding = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorConstant.whiteA700),
    );
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: padding, right: 0, left: 0),
      child: TextFormField(
        enabled: enabled,
        autovalidateMode: focusNode.hasFocus
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        style: AppStyle.txtRobotoRomanMedium18Black900(context),
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        focusNode: focusNode,
        maxLines: manxLines,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: UIhelper.paddingHelper(context,
              top: 20, bottom: 20, right: 19, left: 19),
          // alignLabelWithHint: true,
          filled: true,
          fillColor: ColorConstant.whiteA700,
          // labelText: hint,
          hintText: hint,
          suffixIcon: enabled && icon == null
              ? null
              : icon ??
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: ColorConstant.black900,
                      )),
          hintStyle:
              // enabled
              //     ?
              AppStyle.txtRobotoRomanMedium18Gray90090(context),
          // : AppStyle.txtRobotoRomanMedium18Gray90090(context)
          //     .copyWith(color: ColorConstant.black900),

          labelStyle:
              // enabled
              //     ?
              AppStyle.txtRobotoRomanMedium18Gray90090(context),
          // : AppStyle.txtRobotoRomanMedium18Gray90090(context)
          //     .copyWith(color: ColorConstant.black900),
          errorBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(color: ColorConstant.red50)),
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
