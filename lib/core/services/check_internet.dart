import 'dart:io';

import 'package:flutter/foundation.dart';

///it written for check the internet
///it shows this message when we have not internet
Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');

    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    debugPrint('Internet yok');
    return false;
  }
}
