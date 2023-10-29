import '../../helper/app_export.dart';

class home extends StatelessWidget {
  home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      body: Column(
        children: [
          Container(
            color: ColorConstant.bluegray300,
          )
        ],
      ),
    );
  }
}
