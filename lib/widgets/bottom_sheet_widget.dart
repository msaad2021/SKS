import '../helper/app_export.dart';

class BottomSheetTextFieldWidget extends StatefulWidget {
  const BottomSheetTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.hintText,
      this.list,
      this.validator,
      this.selected,
      this.enabled = true,
      this.validateCheck = true,
      this.padding = 16})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String? Function(String?)? validator;
  final double padding;
  final List<dynamic>? list;
  final ValueChanged<dynamic>? selected;
  final bool enabled;
  final bool validateCheck;
  @override
  State<BottomSheetTextFieldWidget> createState() =>
      _BottomSheetTextFieldWidgetState();
}

class _BottomSheetTextFieldWidgetState
    extends State<BottomSheetTextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        widget.enabled ? bottomSheetWidget(context) : null;
      },
      child: TextFormFieldWidget(
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: false,
        hint: widget.hintText,
        validator: widget.validateCheck
            ? (value) {
                if (Helper.validateRequired(value ?? "").isNotEmpty) {
                  return Helper.validateRequired(value ?? "");
                } else {
                  return null;
                }
              }
            : null,
      ),
    );
  }

  void bottomSheetWidget(BuildContext context) {
    final searchController = TextEditingController();
    List<dynamic> items = widget.list ?? [];
    showModalBottomSheet<void>(
        backgroundColor: ColorConstant.gray50,
        enableDrag: false,
        isDismissible: true,
        elevation: 50,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 500,
              // padding: UIhelper.paddingHelper(context, 20, 50, 15, 15),
              padding: UIhelper.paddingHelper(context,
                  top: 20, bottom: 50, right: 15, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SearchTextFieldWidget(
                    hint: "Search ${widget.hintText}",
                    controller: searchController,
                    enabled: !items.isEmpty,
                    onChanged: (value) {
                      List<dynamic> searchList = [];
                      if (value!.isEmpty) {
                        searchList = widget.list!;
                      } else {
                        searchList = widget.list!
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      }
                      setState(() {
                        items = searchList;
                      });
                    },
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            widget.selected!(items[index]);
                            widget.controller.text = items[index].name;
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                // padding: UIhelper.paddingHelper(
                                //     context, 6, 6, 10, 10),
                                padding: UIhelper.paddingHelper(context,
                                    top: 6, bottom: 6, right: 10, left: 10),
                                child: Text(
                                  items[index].name,
                                  style:
                                      AppStyle.txtRobotoRomanMedium18Black900(
                                          context),
                                  // style: AppStyle.txtSFProTextRegular16(context)
                                  //     .copyWith(color: ColorConstant.gray800),
                                ),
                              ),
                              Divider(
                                height: 10,
                                thickness: 10,
                                // color: ColorConstant.gray800,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                            // padding: UIhelper.paddingHelper(context, 0, 0, 5, 5),
                            child: DividerWidget());
                      },
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
