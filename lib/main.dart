import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'data/services/local_storage_service.dart';
import 'features/navigation/controllers/navigation_controller.dart';
import 'routes/app_pages.dart';
import 'shared/controllers/user_controller.dart';
import 'shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, widget) {
          return GetMaterialApp(
            title: 'Travel Bus App',
            builder: (context, child) {
              return WillPopScope(
                onWillPop: () => NavigationController().onWillPop(),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            theme: AppTheme.lightTheme, // Default light theme
            darkTheme: AppTheme.darkTheme, // Dark theme option
            themeMode: ThemeMode.light, // Will be controlled by GetX
            getPages: AppPages.routes,
          );
        });
  }
}

Future<void> initializeDependencies() async {
  await initializeLocalStorage();
  initializeGetXControllers();
}

// Initialize local storage
Future<void> initializeLocalStorage() async {
  await LocalStorageService.init();
}

// Initialize GetX controllers
void initializeGetXControllers() {
  final userController = Get.put(UserController());
  userController.loadUserData(); // Load user login state
}
