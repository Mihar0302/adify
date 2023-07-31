import 'package:adify/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/global_controller.dart';
import 'helper/shared_pref_helper.dart';

Future<void> main() async {
  final GlobalController global = Get.put(GlobalController());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final prefs = SharedPreferencesHelper(
    pref: await SharedPreferences.getInstance(),
  );

  if (prefs.getJWT != null) {
    global.jwt.value = prefs.getJWT!;
    debugPrint("====> jwt ====> ${global.jwt.value}");
  }

  if (prefs.getUserName != null) {
    global.username.value = prefs.getUserName!;
  }
  runApp(const MyApp());

  // await Geolocator.requestPermission().then((value) async {
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((value) async {
  //     global.placemarks =
  //         await placemarkFromCoordinates(value.latitude, value.longitude);
  //     global.showlocation = LatLng(value.latitude, value.longitude);
  //     debugPrint("ERROR$global.showlocation");
  //   });
  // }).onError((error, stackTrace) async {
  //   await Geolocator.requestPermission();
  //   debugPrint("ERROR$error");
  // }).then(
  //   (value) => ,
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('hi', 'hi'), // Thai
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins", colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(background: Colors.white)),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
    );
  }
}
