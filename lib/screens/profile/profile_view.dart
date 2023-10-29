import '../../helper/app_export.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  String title = "";
  String titleValue = "";

  final ProfileController _controller = Get.put(ProfileController());
  // ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Profile',
        elevation: 0,
      ),
      backgroundColor: ColorConstant.gray50,
      body: SingleChildScrollView(child: Obx(
        () {
          var userInfo = controller.userInfo.value.info;
          return Stack(children: [
            AspectRatio(
              aspectRatio: 414 / 287,
              child: Container(
                color: ColorConstant.blue700,
              ),
            ),
            Column(
              children: [
                const AspectRatio(aspectRatio: 414 / 30),
                Padding(
                  padding: UIhelper.paddingHelper(context,
                      top: 0, bottom: 54, right: 19, left: 19),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          AspectRatio(aspectRatio: 414 / 84),
                          Container(
                            padding: UIhelper.paddingHelper(context,
                                top: 90, bottom: 19, right: 19, left: 19),
                            decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                    getSize(context, 11))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Account Details",
                                    style:
                                        AppStyle.txtRobotoRomanBold20Black900cc(
                                            context),
                                  ),
                                  SizedBox(
                                      height: getVerticalSize(context, 13)),
                                  ProfileDetailWidget(
                                      title: 'Name',
                                      titleValue: userInfo!.firstName ?? ''),
                                  ProfileDetailWidget(
                                      title: 'Department',
                                      titleValue: userInfo.department ?? ''),
                                  ProfileDetailWidget(
                                      title: 'Designation',
                                      titleValue: userInfo.designation ?? ''),
                                  ProfileDetailWidget(
                                      title: 'Reporting to',
                                      titleValue: 'Kamran Khan'),
                                  ProfileDetailWidget(
                                      title: 'Email Address',
                                      titleValue: userInfo.email ?? ''),
                                  ProfileDetailWidget(
                                      title: 'Password',
                                      icon: InkWell(
                                        onTap: () {},
                                        splashColor: ColorConstant.gray200,
                                        child: Icon(
                                          Icons.edit,
                                          color: ColorConstant.red400,
                                        ),
                                      ),
                                      titleValue: '*********'),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Job Description",
                                          style: AppStyle
                                              .txtRobotoRomanBold16Black900(
                                                  context)),
                                      SizedBox(
                                        height: getVerticalSize(context, 10),
                                      ),
                                      Text(
                                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                                        style: AppStyle
                                            .txtRobotoRomanRegular16Black900(
                                                context),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 13),
                          ),
                          Container(
                            padding: UIhelper.paddingHelper(context,
                                top: 22, bottom: 19, right: 19, left: 19),
                            decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                    getSize(context, 11))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      splashColor: ColorConstant.gray100,
                                      child: Padding(
                                        padding: UIhelper.paddingHelper(context,
                                            top: 10,
                                            bottom: 10,
                                            right: 0,
                                            left: 0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.report,
                                              size: getSize(context, 25),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(
                                                  context, 15),
                                            ),
                                            Text('Report an Issue',
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Black900(
                                                        context))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: getVerticalSize(context, 20),
                                  // ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      splashColor: ColorConstant.gray100,
                                      child: Padding(
                                        padding: UIhelper.paddingHelper(context,
                                            top: 10,
                                            bottom: 10,
                                            right: 0,
                                            left: 0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.headset_mic_rounded,
                                              size: getSize(context, 25),
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(
                                                  context, 15),
                                            ),
                                            Text('Contact Admin',
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Black900(
                                                        context))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // DividerWidget(),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: ColorConstant.gray100,
                                      borderRadius: BorderRadius.circular(
                                          getSize(context, 4)),
                                      onTap: () {
                                        controller.logOut();
                                      },
                                      child: Padding(
                                        padding: UIhelper.paddingHelper(context,
                                            top: 10,
                                            bottom: 10,
                                            right: 0,
                                            left: 0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              size: getSize(context, 25),
                                              color: ColorConstant.redA700,
                                            ),
                                            SizedBox(
                                              width: getHorizontalSize(
                                                  context, 15),
                                            ),
                                            Text(
                                              'Logout',
                                              style: AppStyle
                                                      .txtRobotoRomanRegular16Black900(
                                                          context)
                                                  .copyWith(
                                                color: ColorConstant.redA700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: getSize(context, 160),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.gray400,
                              child: Icon(
                                Icons.person,
                                size: getSize(context, 75),
                                color: ColorConstant.blue700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]);
        },
      )),
    );
  }
}

class ProfileDetailWidget extends StatelessWidget {
  ProfileDetailWidget({
    Key? key,
    required this.title,
    required this.titleValue,
    this.icon,
  }) : super(key: key);

  final String title;
  final String titleValue;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppStyle.txtRobotoRomanRegular16Black900(context),
                ),
                SizedBox(
                  width: getHorizontalSize(context, 7),
                ),
                icon ?? Container(),
              ],
            ),
            SizedBox(
              width: getHorizontalSize(context, 40),
            ),
            Flexible(
              child: SizedBox(
                child: Text(
                  titleValue,
                  maxLines: 1,
                  style:
                      AppStyle.txtRobotoRomanBold16Black900(context).copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
        DividerWidget(),
      ],
    );
  }
}
