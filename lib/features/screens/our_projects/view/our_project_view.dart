import 'package:artway_web/app/constant/assets/assets_image.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/app/theme/text_styles.dart/our_project/our_project_styles.dart';
import 'package:artway_web/app/theme/text_styles.dart/our_project/our_project_texts.dart';
import 'package:artway_web/features/screens/our_projects/controller/our_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part '../widget/projects.dart';
part '../widget/promotion_texts.dart';
part '../widget/our_team.dart';
part '../widget/customer_reviews.dart';

class OurProjectView extends GetView<OurProjectController> {
  const OurProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.fromLTRB(
          SizeConfig.width * .2, SizeConfig.height * .1, SizeConfig.width * .2, paddingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(OurProjectTexts.title, style: OurProjectTextStyle.h1),
          SizedBox(height: SizeConfig.height * .05),
          _ProjectPromotionTexts(textList: controller.ourProjectTexts),
          _Projects(projects: controller.ourProjectTexts),
          SizedBox(height: SizeConfig.height * .08),
          _OurTeam(ourTeamList: controller.ourTeamList),
          SizedBox(height: SizeConfig.height * .13),
          _CustomerReviews(customerReviews: controller.ourProjectTexts)
        ],
      ),
    );
  }
}
