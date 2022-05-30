import 'package:artway_web/app/business_logic/manager_api.dart';
import 'package:artway_web/app/constant/http_url.dart';
import 'package:artway_web/app/extensions/general_extension.dart';
import 'package:artway_web/app/models/base_http_model.dart';
import 'package:artway_web/app/models/footer/instagram_model.dart';
import 'package:artway_web/core/services/check_internet.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FooterContoller extends GetxController {
  final connectionTry = false.obs;
  final RxList<InstagramModel> photoList = <InstagramModel>[].obs;

  ///Init işlemlerinin yapıldığı yer, bütün işlemler tamamlandıktan sonra aksiyon alınır.
  init() {
    Future.wait([
      //İşlemler başlamadan önce internet bağlantısı olup olmadığı kontrol edilir.
      checkInternet().then((connection) {
        if (connection) {
          //    getGameIsCompleteStatus();

          getPhotoList();
        } else {
          connectionTry.value = true;
        }
      }),
    ]);
  }

  //Get Instagram Photo List
  Future<void> getPhotoList() async {
    try {
      var response = await ManagerApi().getInstagramModel(InstagramModel(), HttpUrl.photoList);

      if (response.status.isOk) {
        photoList.value = response.data as List<InstagramModel>;
        debugPrint('----------->' + photoList.length.toString());
      } else {
        debugPrint('GET Photo List Hata');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
