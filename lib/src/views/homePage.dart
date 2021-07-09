import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/src/components/appBar.dart';
import 'package:getx_api/src/components/constants.dart';
import 'package:getx_api/src/components/customText.dart';
import 'package:getx_api/src/components/noData.dart';
import 'package:getx_api/src/productController/productController.dart';
import 'dart:math';

import 'package:getx_api/src/views/basketPage.dart';
import 'package:getx_api/src/views/productDetail.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    return Scaffold(
      //AppBar
      appBar: CustomAppBar(
        text: "Home Page",
        widget: IconButton(
          icon: Icon(Icons.lightbulb),
          onPressed: () {
            Get.bottomSheet(
                Container(
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.wb_sunny_outlined),
                        title: Text(
                          "Light Theme",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                          print("light theme");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.wb_sunny),
                        title: Text(
                          "Dark Theme",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                          print("dark theme");
                        },
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2)));
          },
        ),
      ),
      //Body
      body: Obx(() {
        return productController.loading.value
            ? const Center(child: const CircularProgressIndicator())
            : productController.error.value
                ? NoData()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 420, childAspectRatio: 0.8),
                    itemCount: productController.productList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      int randomNumber = random.nextInt(100);
                      return RawMaterialButton(
                        onPressed: () {
                          Get.to(ProductDetail(
                            price: randomNumber,
                            product: productController.productList[index],
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                //Image
                                Image.network(
                                  productController
                                      .productList[index].imageLink,
                                  height: 120,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //Brand
                                CustomText(
                                  color: Colors.black,
                                  sizes: Sizes.small,
                                  text: productController
                                      .productList[index].brand,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //Category
                                CustomText(
                                  color: Colors.black,
                                  sizes: Sizes.small,
                                  text: productController
                                              .productList[index].category ==
                                          ""
                                      ? "PRODUCT"
                                      : productController
                                          .productList[index].category
                                          .toUpperCase(),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                //Price
                                CustomText(
                                  color: Colors.black,
                                  sizes: Sizes.normal,
                                  text:
                                      "$randomNumber ${productController.productList[index].currency}",
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      );
                    });
      }),
    );
  }
}
