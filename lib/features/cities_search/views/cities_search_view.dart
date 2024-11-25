import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/cities_search_controller.dart';

class CitiesSearchView extends StatelessWidget {
  const CitiesSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitiesSearchController>(
      init: CitiesSearchController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 0,
            iconTheme: Theme.of(context).iconTheme,
            title: TextField(
              focusNode: controller.searchFocusNode,
              controller: controller.searchController,
              onChanged: controller.onSearchChanged,
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                hintText: 'Search city or stop...',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 16.sp,
                ),
                border: InputBorder.none,
                suffixIcon: (controller.searchFocusNode.hasFocus &&
                        controller.searchController.text.isNotEmpty)
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        onPressed: () {
                          controller.searchController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      )
                    : Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.surface,
                      ),
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: controller.filteredCities.isEmpty
                  ? Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.filteredCities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            controller.filteredCities[index],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () {
                            // Handle city selection
                            FocusScope.of(context).unfocus();
                            controller
                                .selectCity(controller.filteredCities[index]);
                          },
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
