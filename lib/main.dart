import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_store/src/binding/init_binding.dart';
import 'package:petcare_store/src/config/core/routes/app_pages.dart';
import 'package:petcare_store/src/config/core/routes/app_routes.dart';
import 'package:petcare_store/src/config/theme/app_theme.dart';
// import 'package:petcare_store/services/local_service.dart';
// import 'package:petcare_store/util/provider_local.dart';
import 'package:petcare_store/src/helper/env.dart';
import 'package:petcare_store/src/notification/notification_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();

  try {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseKey,
    );
  } catch (e) {
    throw Exception(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      color: Color(0xffF5F5F7),
      title: 'PetCare Store',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splashScreen,
      getPages: appPages,
    );
  }
}
