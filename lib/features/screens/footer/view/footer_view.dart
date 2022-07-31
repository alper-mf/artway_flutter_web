import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/app/theme/text_styles.dart/footer/footer_styles.dart';
import 'package:artway_web/app/theme/text_styles.dart/footer/footer_texts.dart';
import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(SizeConfig.width * .075, SizeConfig.height * .04,
          SizeConfig.width * .075, SizeConfig.height * .04),
      color: footerBackground,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FooterTexts.testText,
                    style: FooterTextStyle.boldTexts,
                  ),
                  SizedBox(height: SizeConfig.height * .03),
                  Text(
                    FooterTexts.madeItBy,
                    style: FooterTextStyle.normalTexts,
                  ),
                ],
              ),
            ),
          ),
          //Contact
          Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FooterTexts.contact,
                    style: FooterTextStyle.boldTexts,
                  ),
                  SizedBox(height: SizeConfig.height * .03),
                  Text(
                    FooterTexts.contactText1,
                    style: FooterTextStyle.normalTexts,
                  ),
                  Text(
                    FooterTexts.address,
                    style: FooterTextStyle.normalTexts,
                  ),
                  Text(
                    FooterTexts.phone,
                    style: FooterTextStyle.normalTexts,
                  ),
                ],
              )),

          //3. Row
          Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FooterTexts.news,
                    style: FooterTextStyle.boldTexts,
                  ),
                  SizedBox(height: SizeConfig.height * .03),
                  Text(
                    FooterTexts.testText,
                    style: FooterTextStyle.normalTexts,
                  ),
                  Text(
                    FooterTexts.testText,
                    style: FooterTextStyle.normalTexts,
                  ),
                  Text(
                    FooterTexts.testText,
                    style: FooterTextStyle.normalTexts,
                  ),
                ],
              )),
          //4. Row
          Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FooterTexts.instagram,
                    style: FooterTextStyle.boldTexts,
                  ),
                  SizedBox(height: SizeConfig.height * .03),
                ],
              )),
          const Spacer()
        ],
      ),
    );
  }
}
