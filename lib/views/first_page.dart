import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g10_demo/views/second_page.dart';
import 'package:get/get.dart';

import '../constants/size_constants.dart';
import '../product/product_controller.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    SizeConstants.setScreenAwareConstant(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: SafeArea(
        child: Obx(() => Container(
              color: Color.fromRGBO(35, 35, 42, 1.0),
              child: _productController.products!.obs.value.isNotEmpty
                  ? ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _productController.products!.obs.value.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 20,
                            color: Color.fromRGBO(41, 41, 43, 1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(41, 41, 43, 1.0),
                                  //border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "${_productController.products![index].obs.value.title}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'RobotoMono',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "${_productController.products![index].obs.value.rating}",
                                                style: TextStyle(
                                                    fontFamily: 'RobotoMono',
                                                    color: Colors.white),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(20),
                                    ),
                                    _productController.products![index].obs
                                            .value.images!.isNotEmpty
                                        ? Container(
                                            height: ScreenUtil().setHeight(200),
                                            child: ImageSlideshow(
                                              indicatorColor: Colors.white,
                                              indicatorRadius: 5,
                                              children: List<Widget>.generate(
                                                _productController
                                                    .products![index]
                                                    .obs
                                                    .value
                                                    .images!
                                                    .obs
                                                    .value
                                                    .length,
                                                (i) {
                                                  return Image.network(
                                                    _productController
                                                        .products![index]
                                                        .obs
                                                        .value
                                                        .images![i]
                                                        .obs
                                                        .value,
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 10),
                                      child: Text(
                                        _productController.products![index].obs
                                            .value.description!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'RobotoMono',
                                            overflow: TextOverflow.fade),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(SecondPage(_productController
                                                .products![index].obs.value));
                                          },
                                          child: Card(
                                            elevation: 29,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              //set border radius more than 50% of height and width to make circle
                                            ),
                                            color: const Color.fromRGBO(
                                                65, 65, 73, 1.0),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 10, 15, 10),
                                              child: Text(
                                                'Book Now',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'RobotoMono',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Text(
                        "No data",
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                        ),
                      ),
                    ),
            )),
      ),
    );
  }
}
