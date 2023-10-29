import '../../helper/app_export.dart';

class NewNoteView extends StatelessWidget {
  const NewNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Create Note'),
      body: Padding(
        padding: UIhelper.paddingHelper(context,
            top: 27, bottom: 27, right: 30, left: 30),
        child: Column(children: [
          PrticipantListTile(
              imgUrl: "",
              // name: team["name"],
              name: "heyyyyyyy",
              department: "sales"),
        ]),
      ),
    );
  }
}
