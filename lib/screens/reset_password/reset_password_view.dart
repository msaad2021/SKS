import '../../helper/app_export.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordController _controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: (() => UIhelper.unFocus()),
          child: Scaffold(
            // backgroundColor: Colors.,
            body: SingleChildScrollView(
              child: SizedBox(
                height: size(context).height,
                child: Stack(
                  children: [
                    Image.asset('assets/images/background.png',
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: double.infinity),
                    Padding(
                      padding: UIhelper.paddingHelper(context,
                          top: 90, bottom: 58, right: 19, left: 19),
                      child: Form(
                        key: _controller.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/sksLogo.png',
                              width: getHorizontalSize(context, 166),
                              height: getVerticalSize(context, 118),
                            ),
                            SizedBox(
                              height: getVerticalSize(context, 50),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Reset Password",
                                  style:
                                      AppStyle.txtRobotoRomanMedium24(context),
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 28),
                                ),
                                LoginPassFormFieldWidget(
                                  label: "New Password",
                                  focusNode: _controller.focusNodes[0],
                                  keyboardType: TextInputType.text,
                                  controller: _controller.newPassword,
                                  obscure: _controller.obscureNew.value,
                                  validator: (value) {
                                    if (Helper.validateRequired(value ?? "")
                                        .isNotEmpty) {
                                      return Helper.validateRequired(
                                          value ?? "");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onPressed: () {
                                    _controller.obscureNew.value =
                                        !_controller.obscureNew.value;
                                  },
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 19),
                                ),
                                LoginPassFormFieldWidget(
                                  label: "Confirm New Password",
                                  focusNode: _controller.focusNodes[1],
                                  keyboardType: TextInputType.text,
                                  controller: _controller.confirmPassword,
                                  obscure: _controller.obscureConfirm.value,
                                  validator: (value) {
                                    if (Helper.validateRequired(value ?? "")
                                        .isNotEmpty) {
                                      return Helper.validateRequired(
                                          value ?? "");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onPressed: () {
                                    _controller.obscureConfirm.value =
                                        !_controller.obscureConfirm.value;
                                  },
                                ),
                              ],
                            ),
                            DefaultButtonWidget(
                              isLoading: controller.loading.value,
                              buttonText: 'Reset',
                              onPressed: () {
                                UIhelper.unFocus();
                                if (controller.formKey.currentState!.validate()
                                    //     &&
                                    // controller.confirmPassword ==
                                    //     controller.newPassword
                                    ) {
                                  controller.resetPassService();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
