import 'package:todo_app/src/util/export.dart';

void customLoader(){
  Get.defaultDialog(
    backgroundColor: Colors.white,
    title: '',
    contentPadding: EdgeInsets.zero,
    titlePadding: EdgeInsets.zero,
    content: Lottie.asset(Images.loadingLottie, height: 150),
  );
}