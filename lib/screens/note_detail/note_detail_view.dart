import '../../helper/app_export.dart';

class NoteDetailView extends GetView<NoteDetailController> {
  NoteDetailController _controller = Get.put(NoteDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(
        title: 'Notes Thread',
      ),
      body: Obx(() {
        var note = controller.note.value;
        var comments = controller.comments;
        print("Comments length ${comments.length}");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: UIhelper.paddingHelper(context,
                  top: 34, bottom: 28, right: 44, left: 44),
              color: ColorConstant.whiteA700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrticipantListTile(
                      imgUrl: note.noteUserProfileImage ?? "",
                      // name: team["name"],
                      name: note.noteUserName ?? "",
                      department: note.noteUserDesignation ?? ""),
                  SizedBox(
                    height: getVerticalSize(context, 10),
                  ),
                  Text(
                    note.notes ?? '',
                    style: AppStyle.txtRobotoRomanRegular16Black900(context),
                  )
                ],
              ),
            ),
            Padding(
              padding: UIhelper.paddingHelper(context,
                  top: 9, bottom: 0, right: 0, left: 23),
              child: Text(
                "Comments",
                style: AppStyle.txtRobotoRomanBold18(context),
              ),
            ),
            controller.isLoading.value
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: comments.isEmpty
                        ? Center(
                            child: Text(
                            'No Comments',
                            style: AppStyle.txtRobotoRomanBold18(context),
                          ))
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: UIhelper.paddingHelper(context,
                                top: 13, bottom: 13, right: 19, left: 19),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return commentWidget(context, comments[index]);
                            },
                            itemCount: comments.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: getVerticalSize(context, 8),
                              );
                            },
                          ),
                  ),
            Container(
              color: ColorConstant.gray50,
              padding: UIhelper.paddingHelper(context,
                  top: 25, bottom: 10, right: 19, left: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    child: TextFormFieldWidget(
                      padding: 0,
                      hint: 'Write your comment here',
                      controller: controller.commentController,
                      focusNode: controller.focusNode,
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(context, 10),
                  ),
                  Flexible(
                      flex: 1,
                      child: DefaultButtonWidget(
                        isLoading: controller.isCommentLoading.value,
                        buttonText: 'Send',
                        onPressed: () {
                          UIhelper.unFocus();
                          //
                          controller.addNoteCommentService();
                        },
                      ))
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Widget commentWidget(BuildContext context, Comment comment) {
    return Container(
      padding: UIhelper.paddingHelper(context,
          top: 12, bottom: 20, right: 11, left: 11),
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(getSize(context, 3)),
        border: Border.all(color: ColorConstant.bluegray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrticipantListTile(
              imgUrl: comment.commentUserProfileImage ?? "",
              // name: team["name"],
              name: comment.commentUserName ?? "",
              department: comment.commentUserDesignation ?? ""),
          SizedBox(
            height: getVerticalSize(context, 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                comment.comments ?? '',
                style: AppStyle.txtRobotoRomanRegular16Black900(context),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
