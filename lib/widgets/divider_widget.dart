import '../helper/app_export.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    this.padding = 5,
  }) : super(key: key);
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: UIhelper.paddingHelper(context,
              top: padding, bottom: padding, right: 0, left: 0),
          child: Divider(
            thickness: getSize(context, 1),
            color: ColorConstant.black900.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
