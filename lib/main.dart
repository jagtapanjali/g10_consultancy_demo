import 'package:flutter/material.dart';
import 'package:g10_demo/product/product_binding.dart';
import 'package:g10_demo/routes/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter g10 Consultancy demo app',
      theme: ThemeData(fontFamily: 'RobotoMono'),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      initialBinding: ProductBinding(),
    );
  }
}
