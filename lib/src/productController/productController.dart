import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:getx_api/src/apiService/apiService.dart';

class ProductController extends GetxController {
  var loading = true.obs;
  var error = false.obs;
  var productList = [].obs;
  var count = 1.obs;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      var products = await ApiService.fetchApi();
      if (products != null) {
        productList.assignAll(products);
      } else
        error(true);
    } finally {
      loading(false);
    }
  }
}
