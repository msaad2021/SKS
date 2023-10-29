import '../../helper/app_export.dart';

class AddParticipantView extends GetView<AddParticipantController> {
  final AddParticipantController _controller =
      Get.put(AddParticipantController());
  var participant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(title: "Search Participant"),
      body: Obx(() => Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: UIhelper.paddingHelper(context,
                  top: 10, bottom: 0, right: 10, left: 10),
              child: TextFormFieldWidget(
                hint: 'Search',
                controller: controller.search,
                focusNode: controller.focusNodes[0],
                icon: Icon(Icons.search),
              ),
            ),
            Container(
              padding: UIhelper.paddingHelper(context,
                  top: 5, bottom: 10, right: 20, left: 20),
              color: ColorConstant.whiteA700,
              width: size(context).width,
              child: Text(
                "Search Results",
                style: AppStyle.txtRobotoRomanBold18(context),
              ),
            ),
            Expanded(
              child: Container(
                padding: UIhelper.paddingHelper(context,
                    top: 5, bottom: 0, right: 20, left: 20),
                color: ColorConstant.whiteA700,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.participantList.value.length,
                  // itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    // return const DividerWidget(
                    //   padding: 2,
                    // );
                    return SizedBox(
                      height: getVerticalSize(context, 20),
                    );
                  },
                  itemBuilder: (context, index) {
                    participant = controller.participantList.value[index];
                    print(participant);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrticipantListTile(
                            imgUrl: "",
                            name: participant["name"],
                            department: "Sales"),
                        InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {},
                          splashColor: ColorConstant.black900,
                          child: CircleAvatar(
                            radius: getSize(context, 13),
                            backgroundColor:
                                ColorConstant.black900.withOpacity(.7),
                            child: FittedBox(
                                child: Icon(
                              Icons.add,
                              color: ColorConstant.whiteA700,
                            )),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ])),
    );
  }
}
