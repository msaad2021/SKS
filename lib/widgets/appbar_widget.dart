import '../helper/app_export.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    Key? key,
    required this.title,
    this.actions,
    this.elevation,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: ColorConstant.blue700,
      title: Text(
        title,
        style: AppStyle.txtRobotoRomanMedium20(context),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
