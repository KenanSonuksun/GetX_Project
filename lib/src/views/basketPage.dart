import 'package:flutter/material.dart';
import 'package:getx_api/src/components/appBar.dart';
import 'package:getx_api/src/components/constants.dart';
import 'package:getx_api/src/components/customButton.dart';
import 'package:getx_api/src/components/customText.dart';
import 'package:getx_api/src/productController/productController.dart';
import 'package:get/get.dart';

class BasketPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "My Basket",
        widget: SizedBox(),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.monetization_on, color: secondaryColor),
            title: Obx(() => CustomText(
                  color: Colors.black,
                  sizes: Sizes.title,
                  text:
                      "${productController.totalPrice.value.toString()} Dolars",
                )),
          ),
          CustomButton(
            topPadding: 10,
            label: "Submit",
            onPressed: () {
              Get.snackbar("Order is successed",
                  "After 20-25 minutes, your order will be delivered",
                  snackPosition: SnackPosition.BOTTOM);
            },
          ),
        ],
      ),
    );
  }
}
