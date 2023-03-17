import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/size_constants.dart';
import '../model/product_model.dart';

class SecondPage extends StatefulWidget {
  Products? products;

  SecondPage(this.products, {Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState(products: products);
}

class _SecondPageState extends State<SecondPage> {
  Products? products;
  _SecondPageState({this.products});

  @override
  Widget build(BuildContext context) {
    SizeConstants.setScreenAwareConstant(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 42, 1.0),
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Center(
                    child: Flexible(
                      child: Text(
                        "${products!.title}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  products!.images!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Card(
                            elevation: 20,
                            color: const Color.fromRGBO(55, 55, 59, 1.0),
                            child: Container(
                              height: ScreenUtil().setHeight(200),
                              child: ImageSlideshow(
                                indicatorColor: Colors.white,
                                indicatorRadius: 5,
                                children: List<Widget>.generate(
                                  products!.images!.length,
                                  (i) {
                                    return Image.network(
                                      products!.images![i],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${products!.rating}",
                        style: const TextStyle(
                            fontFamily: 'RobotoMono', color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                'Brand: ${products!.brand}',
                style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.fade),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                ' ${products!.description}',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                    overflow: TextOverflow.fade),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    'Price: ${products!.price} ₹',
                    style: const TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    'Discount: ${products!.discountPercentage} %',
                    style: const TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                'Hurry Up!! Only ${products!.stock} left',
                style: const TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: 'RobotoMono',
                    overflow: TextOverflow.fade),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Card(
                    elevation: 29,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    color: const Color.fromRGBO(65, 65, 73, 1.0),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
