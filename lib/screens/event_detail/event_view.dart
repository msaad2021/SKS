import 'package:sks/helper/app_export.dart';

class EventView extends StatelessWidget {
  EventView({super.key});

  String name = "Sania Adeel";
  String department = "Sales";
  String imgUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: const AppbarWidget(title: "Meating with CEO"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorConstant.gray50,
            padding: UIhelper.paddingHelper(context,
                top: 21, bottom: 21, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today",
                  style: AppStyle.txtRobotoRomanRegular14Gray70099(context),
                ),
                Text(
                  "Thursday, 26 May 2022",
                  style: AppStyle.txtRobotoRomanBold18(context),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ColorConstant.whiteA700,
              padding: UIhelper.paddingHelper(context,
                  top: 25, bottom: 25, right: 29, left: 29),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: AppStyle.txtRobotoRomanBold18(context),
                    ),
                    SizedBox(
                      height: getVerticalSize(context, 20),
                    ),
                    Text(
                      "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur.",
                      style: AppStyle.txtRobotoRomanRegular16Black900(context),
                    ),
                    SizedBox(
                      height: getVerticalSize(context, 20),
                    ),
                    Text(
                      "Participants:",
                      style: AppStyle.txtRobotoRomanBold18(context),
                    ),
                    SizedBox(
                      height: getVerticalSize(context, 20),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) {
                            return const DividerWidget();
                          },
                          itemBuilder: (context, participant) {
                            return PrticipantListTile(
                                imgUrl: imgUrl,
                                name: name,
                                department: department);
                          },
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
