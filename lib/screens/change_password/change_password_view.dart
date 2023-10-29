import '../../helper/app_export.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(title: 'Change your password'),
      body: Padding(
        padding: UIhelper.paddingHelper(context,
            top: 30, bottom: 0, right: 19, left: 19),
        child: Column(children: [
          TextFormFieldWidget(
              hint: 'Current password',
              controller: currentPassword,
              focusNode: focusNodes[0]),
          TextFormFieldWidget(
              hint: 'New password',
              controller: newPassword,
              focusNode: focusNodes[1]),
          TextFormFieldWidget(
              hint: 'Confirm password',
              controller: confirmPassword,
              focusNode: focusNodes[2]),
          Padding(
            padding: UIhelper.paddingHelper(context,
                top: 40, bottom: 0, right: 0, left: 0),
            child: DefaultButtonWidget(
                buttonText: 'Change password', onPressed: () {}),
          )
        ]),
      ),
    );
  }
}
