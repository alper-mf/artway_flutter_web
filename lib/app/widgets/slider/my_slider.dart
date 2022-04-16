import 'dart:async';

import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/models/response/slider_model.dart';
import 'package:artway_web/app/theme/text_style.dart';
import 'package:artway_web/app/widgets/buttons/hover_button.dart';
import 'package:artway_web/app/widgets/slider/controller/slider_controller.dart';
import 'package:artway_web/app/widgets/slider/widgets/indicator_text_button.dart';
import 'package:flutter/material.dart';

part './widgets/indicator.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  late PageController _pageController;
  final List<Map<String, String>> _imageMap = [
    {
      "imageUrl":
          'https://brok.qodeinteractive.com/wp-content/uploads/2021/11/h1-port-img-3.jpg'
    },
    {
      "imageUrl":
          'https://brok.qodeinteractive.com/wp-content/uploads/2021/11/h1-port-img-2.jpg'
    },
    {
      "imageUrl":
          'https://brok.qodeinteractive.com/wp-content/uploads/2021/11/h1-port-list-img-1-3.jpg'
    }
  ];
  final List<SliderModel> _imageList = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < _imageMap.length; i++) {
      var element = _imageMap[i];
      _imageList.add(SliderModel(
        id: i,
        title: '$i. Element ',
        imageUrl: element['imageUrl'],
        subtitle: '$i. Subtitle',
      ));
    }

    _pageController = PageController(
      viewportFraction: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          SizedBox.expand(
            child: PageView.builder(
                controller: _pageController,
                itemCount: _imageList.length,
                onPageChanged: (int i) {
                  SliderController.indicatorIndex.value = i;
                },
                itemBuilder: ((context, index) {
                  var item = _imageList[index];
                  return DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: NetworkImage(item.imageUrl!),
                    fit: BoxFit.cover,
                  )));
                })),
          ),
          Row(
            children: [
              const SizedBox(width: sizeM),
              const Spacer(flex: 1),
              Flexible(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Future City Buildings',
                        style: s20w700Dark(context).copyWith(
                            fontSize: MediaQuery.of(context).size.width * .05,
                            color: Colors.white),
                      ),
                      const SizedBox(height: paddingM),
                      const HoverButton(
                        text: ' + VIEW MORE',
                        isSelected: true,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      )
                    ],
                  )),
              const Spacer(flex: 4),
            ],
          ),
          _IndicatorWidget(imageList: _imageList),
        ],
      ),
    );
  }
}
