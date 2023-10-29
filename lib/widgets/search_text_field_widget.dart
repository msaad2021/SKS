import '../helper/app_export.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;

  const SearchTextFieldWidget({
    Key? key,
    this.hint,
    this.label,
    required this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorConstant.whiteA700),
    );
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: 15, right: 0, left: 0),
      child: TextFormField(
        enabled: enabled,
        style: AppStyle.txtRobotoRomanMedium18Black900(context),
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          // alignLabelWithHint: true,
          filled: true,
          fillColor: ColorConstant.whiteA700,
          hintText: hint,
          hintStyle: AppStyle.txtRobotoRomanMedium18Gray90090(context),
          errorBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(color: ColorConstant.red50)),
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          // errorStyle: TextStyle(
          //   color: ColorConstant.red50,
          // ),
        ),
      ),
    );
  }
}
