import '../helper/app_export.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({
    Key? key,
    this.imageUrl = "",
    this.enabled = true,
    this.isLoading = false,
    this.radius = 95,
    // this.width = (CustomGlobals.isScrWidthGreater400 ? 52 : 42) * 2
    this.width = 94,
  }) : super(key: key);
  final String imageUrl;
  final bool enabled;
  final bool isLoading;
  final double radius;
  final double width;

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      Icons.person,
      color: ColorConstant.gray100,
    );
    return SizedBox(
      width: getHorizontalSize(context, widget.width),
      child: AspectRatio(
        aspectRatio: 1,
        child: (widget.imageUrl.isEmpty)
            ? CircleAvatar(
                backgroundColor: ColorConstant.gray400,
                radius: double.infinity,
                child: icon,
              )
            : widget.isLoading
                ? Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.gray400, shape: BoxShape.circle),
                    width: widget.width,
                    child: const Center(child: CircularProgressIndicator()))
                : ImageWidget(width: widget.width, imageUrl: widget.imageUrl),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    this.imageUrl = "",
    this.height = 100,
    this.width = 100,
  }) : super(key: key);

  final String? imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(context, width),
      // width: getSize(context, width),
      // height: getSize(context, height), // Border width
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: ColorConstant.gray106,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
            child: Image.network(imageUrl ?? "", fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
          return Icon(
            Icons.person,
            // color: ColorConstant.indigo900,
            size: getSize(context, 30.00),
          );
        })),
      ),
    );
  }
}
