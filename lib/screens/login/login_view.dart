import 'package:sks/helper/app_export.dart';

class LoginView extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  // bool obscurePassword = true;

  // @override
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: (() => UIhelper.unFocus()),
          child: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: size(context).height,
                child: Stack(
                  children: [
                    Image.asset(ImageConstant.backgroundImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity),
                    Padding(
                      padding: UIhelper.paddingHelper(context,
                          top: 90, bottom: 58, right: 19, left: 19),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              ImageConstant.sksLogo,
                              // width: getHorizontalSize(context, 166),
                              // height: getVerticalSize(context, 118),
                            ),
                            SizedBox(
                              height: getVerticalSize(context, 50),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Login to Your Account",
                                  style:
                                      AppStyle.txtRobotoRomanMedium24(context),
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 28),
                                ),
                                LoginTextFormFieldWidget(
                                  hint: "someone@sks.com",
                                  label: "Email Address",
                                  controller: controller.emailController,
                                  focusNode: controller.focusNodes[0],
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (Helper.validateEmail(value ?? "")
                                        .isNotEmpty) {
                                      return Helper.validateEmail(value ?? "");
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                // Text(
                                //   "Email",

                                //   // style:
                                //   //     AppStyle.txtRobotoRomanMedium24(context),
                                // ),
                                // TextFormFieldWidget(
                                //   hint: "someone@sks.com",
                                //   label: "Email Address",
                                //   controller: controller.emailController,
                                //   focusNode: controller.focusNodes[0],
                                //   keyboardType: TextInputType.emailAddress,
                                //   validator: (value) {
                                //     if (Helper.validateEmail(value ?? "")
                                //         .isNotEmpty) {
                                //       return Helper.validateEmail(value ?? "");
                                //     } else {
                                //       return null;
                                //     }
                                //   },
                                // ),
                                SizedBox(
                                  height: getVerticalSize(context, 15),
                                ),
                                LoginPassFormFieldWidget(
                                  label: "Password",
                                  focusNode: controller.focusNodes[1],
                                  keyboardType: TextInputType.text,
                                  controller: controller.passwordController,
                                  obscure: controller.obscurePassword.value,
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
                                    controller.obscurePassword.value =
                                        !controller.obscurePassword.value;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        UIhelper.unFocus();
                                        Get.to(() => ForgotPasswordView());
                                      },
                                      child: Text(
                                        "Forgot Password",
                                        style: AppStyle
                                            .txtRobotoRomanRegular16WhiteA700(
                                                context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            DefaultButtonWidget(
                              buttonText: 'Login',
                              isLoading: controller.loading.value,
                              onPressed: () {
                                UIhelper.unFocus();
                                if (_formKey.currentState!.validate()) {
                                  debugPrint("loginService");
                                  controller.loginService();
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
