import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raj_kalpana_travels/features/home/views/home_view.dart';

import '../../../shared/controllers/user_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../profile/views/profile_view.dart';
import '../../ticket_listing/views/ticket_listing_view.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0;
  final userController = Get.find<UserController>();
  final controller = Get.put(HomeController());

  // List of GlobalKeys for each tab
  final loggedInKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  final guestKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final loggedInTabs = [
    const HomeView(),
    const TicketListingView(),
    const ProfileView(),
  ];

  final guestTabs = [
    const HomeView(),
    const ProfileView(),
  ];

  List<Map<String, dynamic>> get navigationItems {
    if (userController.isLoggedIn.value) {
      return [
        {'label': 'Home', 'icon': Icons.home},
        {'label': 'Tickets', 'icon': Icons.receipt},
        {'label': 'Profile', 'icon': Icons.person},
      ];
    } else {
      return [
        {'label': 'Home', 'icon': Icons.home},
        {'label': 'Profile', 'icon': Icons.person},
      ];
    }
  }

  List<dynamic> get tabs =>
      userController.isLoggedIn.value ? loggedInTabs : guestTabs;
  List<dynamic> get navigatorKeys =>
      userController.isLoggedIn.value ? loggedInKeys : guestKeys;

  void changeTab(int index) {
    if (index == selectedIndex) {
      navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      selectedIndex = index;
      update();
    }
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[selectedIndex].currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (selectedIndex != 0) {
        changeTab(0);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }
}
