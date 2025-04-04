import 'package:get/get.dart';

class SideNavigationController extends GetxController {
  // Observable variables
  var selectedIndex = 0.obs;

  // Method to update the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
