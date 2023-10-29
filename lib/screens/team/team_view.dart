import '../../helper/app_export.dart';

class TeamView extends GetView<TeamController> {
  final TeamController _controller = Get.put(TeamController());
  var team;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(title: "My team"),
      body: Obx(() => Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: UIhelper.paddingHelper(context,
                  top: 25, bottom: 0, right: 19, left: 19),
              child: TextFormFieldWidget(
                hint: 'Search',
                controller: controller.search,
                focusNode: controller.focusNodes[0],
                icon: const Icon(Icons.search),
              ),
            ),
            // Container(
            //   padding: UIhelper.paddingHelper(context,
            //       top: 5, bottom: 10, right: 20, left: 20),
            //   color: ColorConstant.whiteA700,
            //   width: size(context).width,
            //   child: Text(
            //     "Search Results",
            //     style: AppStyle.txtRobotoRomanBold18(context),
            //   ),
            // ),
            Expanded(
              child: Container(
                padding: UIhelper.paddingHelper(context,
                    top: 15, bottom: 0, right: 20, left: 20),
                color: ColorConstant.whiteA700,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.teamList.value.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: getVerticalSize(context, 20),
                    );
                  },
                  itemBuilder: (context, index) {
                    team = controller.teamList.value[index];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: ColorConstant.blue700,
                        // customBorder: CircleBorder(),
                        onTap: () {
                          Get.to(() => ProfileView());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrticipantListTile(
                                imgUrl: "",
                                name: team["name"],
                                department: "Sales"),
                            CircleAvatar(
                              radius: getSize(context, 7),
                              backgroundColor: Colors.transparent,
                              // ColorConstant.whiteA700.withOpacity(.7),
                              child: FittedBox(
                                  child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorConstant.black900,
                              )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ])),
    );
  }
}
