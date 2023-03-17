import 'package:g10_demo/product/product_binding.dart';
import 'package:get/route_manager.dart';

import '../views/first_page.dart';

class Routes {
  static const INITIAL = '/first';

  static final routes = [
    GetPage(name: '/first', page: () => FirstPage(), binding: ProductBinding()),
    // GetPage(
    //     name: '/second',
    //     //page: () => const SecondPage(),
    //     binding: ProductBinding()),
  ];
}
