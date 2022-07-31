part of '../view/our_project_view.dart';

class _ProjectPromotionTexts extends StatelessWidget {
  const _ProjectPromotionTexts({
    Key? key,
    required this.textList,
  }) : super(key: key);

  final List<Map<String, String>> textList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: textList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: SizeConfig.width * .03,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          final item = textList[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item['title']!, style: OurProjectTextStyle.boldTexts),
              SizedBox(height: SizeConfig.height * .03),
              Text(item['text']!, style: OurProjectTextStyle.normalTexts),
            ],
          );
        });
  }
}
