import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nkap_agent/screens/home.dart';
import 'package:nkap_agent/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'api/api_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MyController(), permanent: true);
  await GetStorage.init();
  const supabaseUrl = 'https://lzxrlntkcxdgmavcyreu.supabase.co';
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx6eHJsbnRrY3hkZ21hdmN5cmV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAwNDU3ODcsImV4cCI6MjAzNTYyMTc4N30.MfxobxU5Aj1a-_2qpAvcQ6knvOE9-JTPivtT3uf65Bc',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final MyController cw = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, c, f) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:
              cw.localDB.read("userData") != null ? HomePage() : SplashScreen(),
        );
      },
    );
  }
}
