part of '../my_slider.dart';

class _IndicatorWidget extends StatelessWidget {
  const _IndicatorWidget({
    Key? key,
    required List<SliderModel> imageList,
  })  : _imageList = imageList,
        super(key: key);

  final List<SliderModel> _imageList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .48,
        color: backgroundColor,
        child: Container(
            margin: const EdgeInsets.fromLTRB(
                paddingXXXL * 2, paddingXXXL, paddingXXXL * 2, 0),
            child: ValueListenableBuilder(
                valueListenable: SliderController.indicatorIndex,
                builder: (BuildContext context, int index, Widget? widget) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _imageList.map((e) {
                      bool isBold = index == e.id ? true : false;
                      return IndicatorTextButton(
                        index: e.id!,
                        subtitle: e.subtitle!,
                        title: e.title!,
                        isSelected: isBold,
                      );
                    }).toList(),
                  );
                })),
      ),
    );
  }
}
