
import 'package:todo_app/src/theme/light_theme.dart';
import 'package:todo_app/src/util/export.dart';

void main()async{
  await GetStorage.init();
  Get.put(NoteController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customTheme(),
      title: AppConstants.appName,
      home: SplashScreen(),
    );
  }
}
