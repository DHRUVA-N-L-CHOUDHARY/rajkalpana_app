import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../widgets/custom_navigation_bar.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: List.generate(controller.tabs.length, (index) {
              return _buildOffstageNavigator(controller, index);
            }),
          ),
          bottomNavigationBar: const CustomNavigationBar(),
        );
      },
    );
  }

  Widget _buildOffstageNavigator(NavigationController controller, int index) {
    if (index >= controller.navigatorKeys.length ||
        index >= controller.tabs.length) {
      return const SizedBox.shrink();
    }
    return Offstage(
      offstage: controller.selectedIndex != index,
      child: Navigator(
        key: controller.navigatorKeys[index],
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (_) => controller.tabs[index],
        ),
      ),
    );
  }
}
