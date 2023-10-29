import '../../helper/app_export.dart';

class NotesView extends GetView<NotesController> {
  NotesController _controller = Get.put(NotesController());

  List<FocusNode> focusNodes = [FocusNode()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.gray50,
      appBar: const AppbarWidget(
        title: 'Notes',
      ),
      body: Obx(() => Padding(
            padding: UIhelper.paddingHelper(context,
                top: 25, bottom: 23, right: 19, left: 19),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormFieldWidget(
                      controller: controller.search,
                      focusNode: focusNodes[0],
                      hint: 'Search notes',
                      icon: Icon(Icons.search),
                    ),
                    controller.isLoading.value
                        ? Expanded(
                            child: Center(child: CircularProgressIndicator()))
                        : Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return notesWidget(
                                          context, controller.notesList[index]);
                                    },
                                    itemCount: controller.notesList.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: getVerticalSize(context, 14),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(context, 70),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButtonWidget(
                    buttonText: 'Create note',
                    onPressed: () {
                      Get.to(() => NewNoteView());
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget notesWidget(BuildContext context, Note note) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(getSize(context, 11)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => NoteDetailView(), arguments: note);
          },
          borderRadius: BorderRadius.circular(getSize(context, 11)),
          splashColor: ColorConstant.gray300,
          child: Container(
              padding: UIhelper.paddingHelper(context,
                  top: 17, bottom: 17, right: 25, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrticipantListTile(
                          imgUrl: note.noteUserProfileImage ?? "",
                          // name: team["name"],
                          name: note.noteUserName ?? "",
                          department: note.noteUserDesignation ?? ""),
                      Padding(
                        padding: UIhelper.paddingHelper(context,
                            top: 7, bottom: 0, right: 0, left: 0),
                        child: CircleAvatar(
                          radius: getSize(context, 10),
                          backgroundColor: Colors.transparent,
                          // ColorConstant.whiteA700.withOpacity(.7),
                          child: FittedBox(
                              child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorConstant.black900,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getVerticalSize(context, 10),
                  ),
                  Text(
                    note.notes ?? "",
                    style: AppStyle.txtRobotoRomanRegular16Black900(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
