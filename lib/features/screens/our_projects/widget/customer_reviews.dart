part of '../view/our_project_view.dart';

class _CustomerReviews extends StatelessWidget {
  const _CustomerReviews({Key? key, required this.customerReviews}) : super(key: key);

  final List<Map<String, String>> customerReviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * .3,
      width: SizeConfig.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: SvgPicture.asset(AppAssets.leftArrow)),
          Flexible(
            flex: 10,
            child: PageView.builder(
                itemCount: customerReviews.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final item = customerReviews[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.width * .07, right: SizeConfig.width * .07),
                    child: Column(
                      children: [
                        SvgPicture.asset(AppAssets.quoteIcon),
                        SizedBox(height: SizeConfig.height * .05),
                        Text(item['text']!,
                            textAlign: TextAlign.center,
                            style: OurProjectTextStyle.normalTexts.copyWith(
                                fontWeight: FontWeight.w200,
                                wordSpacing: SizeConfig.height * (.01 / 2),
                                height: SizeConfig.height * (.01 / 4.5),
                                fontStyle: FontStyle.italic)),
                        SizedBox(height: SizeConfig.height * .03),
                        Text(item['title']!, style: OurProjectTextStyle.boldTexts),
                      ],
                    ),
                  );
                }),
          ),
          Flexible(child: SvgPicture.asset(AppAssets.rightArrow)),
        ],
      ),
    );
  }
}
