import '../../export.dart';

textStyle() {
  return Theme.of(Get.context!).textTheme.headline2;
}

textStyleBold({color, fontize}) {
  return Theme.of(Get.context!).textTheme.headline1;
}

toast(message) {
  Get.closeAllSnackbars();
  return Get.snackbar(' ', message);
}
