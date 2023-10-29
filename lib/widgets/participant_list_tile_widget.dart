import '../helper/app_export.dart';

class PrticipantListTile extends StatelessWidget {
  const PrticipantListTile({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.department,
  }) : super(key: key);

  final String imgUrl;
  final String name;
  final String department;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileImageWidget(
          width: 38,
          imageUrl: imgUrl,
        ),
        SizedBox(
          width: getHorizontalSize(context, 11),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppStyle.txtRobotoRomanMedium18Black900(context),
            ),
            Text(
              department,
              style: AppStyle.txtRobotoRomanRegular16Black900(context)
                  .copyWith(color: ColorConstant.black900.withOpacity(0.6)),
            )
          ],
        )
      ],
    );
  }
}
