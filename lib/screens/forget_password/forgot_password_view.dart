import '../../helper/app_export.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordController _controller = Get.put(ForgotPasswordController());

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
                                "Forgot Password",
                                style: AppStyle.txtRobotoRomanMedium24(context),
                              ),
                              SizedBox(
                                height: getVerticalSize(context, 28),
                              ),
                              Form(
                                key: controller.formKey,
                                child: LoginTextFormFieldWidget(
                                  hint: "someone@sks.com",
                                  label: "Email Address",
                                  controller: _controller.emailController,
                                  // controller: emailController,
                                  focusNode: _controller.focusNodes[0],
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
                              ),
                            ],
                          ),
                          DefaultButtonWidget(
                            isLoading: controller.loading.value,
                            buttonText: 'Find Account',
                            onPressed: () {
                              UIhelper.unFocus();
                              if (controller.formKey.currentState!.validate()) {
                                controller.forgotPasswordService();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: UIhelper.paddingHelper(context,
                          top: 50, bottom: 0, right: 0, left: 0),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios,
                              color: ColorConstant.black900)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
