import 'package:todo_app/src/util/export.dart';

void closeLoader(){
  if(Get.isDialogOpen == true){
    Get.back();
  }
}