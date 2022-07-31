import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/app/theme/text_styles.dart/our_project/our_project_styles.dart';
import 'package:artway_web/app/theme/text_styles.dart/our_project/our_project_texts.dart';
import 'package:artway_web/features/screens/our_projects/controller/our_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

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
          Text(
            OurProjectTexts.title,
            style: OurProjectTextStyle.h1,
          ),
          SizedBox(height: SizeConfig.height * .05),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.ourProjectTexts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.width * .03,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                final item = controller.ourProjectTexts[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(item['title']!, style: OurProjectTextStyle.boldTexts),
                    SizedBox(height: SizeConfig.height * .03),
                    Text(item['text']!, style: OurProjectTextStyle.normalTexts),
                  ],
                );
              }),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: SizeConfig.height * .05,
            crossAxisSpacing: SizeConfig.width * .03,
            children: controller.ourProjectTexts
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
                            style: OurProjectTextStyle.normalTexts.copyWith(
                                fontWeight: FontWeight.w200, fontStyle: FontStyle.italic)),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
