import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/src/components/appBar.dart';
import 'package:getx_api/src/components/constants.dart';
import 'package:getx_api/src/components/customButton.dart';
import 'package:getx_api/src/components/customText.dart';
import 'package:getx_api/src/productController/productController.dart';
import 'package:getx_api/src/views/basketPage.dart';

class ProductDetail extends StatelessWidget {
  final product, price;
  ProductDetail({Key key, this.product, this.price}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: product.brand,
        widget: SizedBox(),
      ),
      body: Column(
        children: [
          //Image
          Image.network(
            product.imageLink,
            height: 200,
          ),
          //Category
          ListTile(
              leading: Icon(
                Icons.branding_watermark,
                color: secondaryColor,
              ),
              title: CustomText(
                color: Colors.black,
                sizes: Sizes.normal,
                text: product.category,
              )),
          //Description
          ListTile(
            leading: Icon(
              Icons.description,
              color: secondaryColor,
            ),
            title: CustomText(
              color: Colors.black,
              sizes: Sizes.normal,
              text: product.description,
            ),
          ),
          //Price
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: secondaryColor,
            ),
            title: CustomText(
              color: Colors.black,
              sizes: Sizes.title,
              text: "${price.toString()}  ${product.currency}",
            ),
          ),
          //A button to add to basket
          CustomButton(
            label: "Add To Basket",
            topPadding: 10,
            onPressed: () {
              Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.wb_sunny_outlined),
                          title: Obx(
                            () => Text(
                                "${productController.count.value.toString()} "),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    productController.count.value += 1;
                                  }),
                              IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    if (productController.count.value > 0) {
                                      productController.count.value -= 1;
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Center(
                          child: CustomButton(
                            label: "Go to Basket",
                            onPressed: () {
                              productController.totalPrice.value =
                                  (productController.count.value) * price;

                              Get.to(BasketPage());
                            },
                            topPadding: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2)));
            },
          ),
        ],
      ),
    );
  }
}
