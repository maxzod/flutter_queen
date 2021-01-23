import 'package:flutter_queen/src/schema/queen.dart';
import 'package:flutter_queen/src/imports.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Queen extends QueenInterface {
  /// * will remove the '#' from url on web platforms only
  /// * before => abc.com/#/home
  /// * after  => abc.com/home

  static void removeTheHash() => Queen().removeTheHashFromPath();

  @override
  void removeTheHashFromPath() {
    // * is app running on web platform ?
    if (kIsWeb) {
      setUrlStrategy(PathUrlStrategy());
    }
  }
}
