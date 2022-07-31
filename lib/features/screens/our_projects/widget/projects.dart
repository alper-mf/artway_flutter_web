part of '../view/our_project_view.dart';

class _Projects extends StatelessWidget {
  const _Projects({Key? key, required this.projects}) : super(key: key);

  final List<Map<String, String>> projects;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: SizeConfig.height * .05,
      crossAxisSpacing: SizeConfig.width * .03,
      children: projects
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: SizeConfig.height * .5,
                    width: SizeConfig.width,
                    child: Image.network(e['image']!, fit: BoxFit.cover),
                  ),
                  SizedBox(height: SizeConfig.height * .02),
                  Text(e['title']!, style: OurProjectTextStyle.boldTexts),
                  SizedBox(height: SizeConfig.height * .01),
                  Text(e['text']!,
                      style: OurProjectTextStyle.normalTexts
                          .copyWith(fontWeight: FontWeight.w200, fontStyle: FontStyle.italic)),
                ],
              ))
          .toList(),
    );
  }
}
