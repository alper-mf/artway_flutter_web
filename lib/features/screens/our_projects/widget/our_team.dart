part of '../view/our_project_view.dart';

class _OurTeam extends StatelessWidget {
  const _OurTeam({Key? key, required this.ourTeamList}) : super(key: key);

  final List<Map<String, String>> ourTeamList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(OurProjectTexts.ourTeam, style: OurProjectTextStyle.h1),
        SizedBox(height: SizeConfig.height * .05),
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: SizeConfig.height * .05,
          crossAxisSpacing: SizeConfig.width * .03,
          children: ourTeamList
              .map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Image.network(e['image']!, fit: BoxFit.cover),
                      ),
                      SizedBox(height: SizeConfig.height * .02),
                      Text(e['name']!, style: OurProjectTextStyle.boldTexts),
                      SizedBox(height: SizeConfig.height * .01),
                      Text(e['work_type']!,
                          style: OurProjectTextStyle.normalTexts
                              .copyWith(fontWeight: FontWeight.w200, fontStyle: FontStyle.italic)),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
