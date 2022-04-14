import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/widgets/slider/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  final String url =
      'https://brok.qodeinteractive.com/wp-content/uploads/2021/11/h1-port-img-2.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(url),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .48,
              color: backgroundColor,
              child: Container(
                margin: const EdgeInsets.fromLTRB(
                    paddingXXXL * 2, paddingXXXL, paddingXXXL * 2, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IndicatorTextButton(
                      index: '2',
                      title: 'FUTURE CITY BUILDINGS',
                      subtitle: 'Housing',
                    ),
                    IndicatorTextButton(
                      index: '2',
                      title: 'FUTURE CITY BUILDINGS',
                      subtitle: 'Housing',
                    ),
                    IndicatorTextButton(
                      index: '2',
                      title: 'FUTURE CITY BUILDINGS',
                      subtitle: 'Housing',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
