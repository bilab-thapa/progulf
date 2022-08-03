import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:progulf/screens/checkout/payment_screen.dart';
import 'package:progulf/screens/head/about_webview_page.dart';
import 'package:progulf/screens/category_screen/category_items.dart';
import 'package:progulf/screens/head/mapzone.dart';
import 'package:progulf/screens/main/favourite.dart';
import 'package:progulf/utils/detail_product_screen.dart';
import 'package:progulf/screens/auth/forgotpw.dart';
import 'package:progulf/screens/auth/login.dart';
import 'package:progulf/screens/auth/register.dart';
import 'package:progulf/widgets/bottom_navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'model/favourite.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(FavouriteMAdapter());
  await Hive.openBox('favourite');
  AwesomeNotifications().initialize('resource://drawable/logo', [
    NotificationChannel(
        channelKey: "Basic",
        channelName: "Basic Notification",
        channelDescription: "This is High Priority",
        defaultColor: Colors.amber,
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);
  // Stripe.publishableKey =
  //     'pk_test_51LPSYFKQYV00RoFnRi23NLP1oPlfQtt1RwZSmBuzJUMlYlan3eIuzmbtevaeSGjYkCUwIzYQERQHDk4rB9b2hyDd00o5LcUM52';
  // await Stripe.instance.applySettings();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/about': (context) => AboutPage(),
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/forgot': (context) => ForgotPassword(),
      '/map': (context) => MapZone(),
      '/home': (context) => BottomNavigation(),
      '/productinfo': (context) => ProductDetail(),
      '/category': (context) => CategoryItems(),
      '/fav': (context) => Favourite(),
      '/checkout': (context) => Checkout()
    },
  ));
}
