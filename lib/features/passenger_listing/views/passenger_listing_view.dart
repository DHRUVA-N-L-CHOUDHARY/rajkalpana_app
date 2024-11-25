import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/passenger_listing_controller.dart';

class PassengerListingView extends StatelessWidget {
  const PassengerListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerListingController>(
      init: PassengerListingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Column(
            children: [
              _buildHeader(controller, context),
              _buildPassengerList(controller, context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(PassengerListingController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                // Back button action
              },
            ),
            title: Text(
              "Passenger List",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Add Passenger action
                  controller.addPassenger();
                },
                child: Text(
                  "+ Add Passenger",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerList(PassengerListingController controller, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: ListView.builder(
          itemCount: controller.passengers.length,
          itemBuilder: (context, index) {
            return _buildPassengerCard(controller, index, context);
          },
        ),
      ),
    );
  }

  Widget _buildPassengerCard(PassengerListingController controller, int index, BuildContext context) {
    final passenger = controller.passengers[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          controller.toggleExpanded(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPassengerSummary(controller, passenger, index, context),
              if (controller.expandedIndex == index)
                _buildPassengerDetails(controller, index, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPassengerSummary(PassengerListingController controller,
      Map<String, dynamic> passenger, int index, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            passenger['name'],
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
        Text(
          "${passenger['age']} years, ${passenger['gender']}",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 14.sp,
          ),
        ),
        Icon(
          controller.expandedIndex == index
              ? Icons.expand_less
              : Icons.expand_more,
          color: Theme.of(context).iconTheme.color,
        ),
      ],
    );
  }

  Widget _buildPassengerDetails(PassengerListingController controller, int index, BuildContext context) {
    final passenger = controller.passengers[index];
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: "Name",
            initialValue: passenger['name'],
            onChanged: (value) {
              controller.updatePassengerName(index, value);
            },
            context: context,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: "Age",
                  initialValue: passenger['age'].toString(),
                  onChanged: (value) {
                    controller.updatePassengerAge(
                        index, int.tryParse(value) ?? 0);
                  },
                  context: context,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Gender",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: passenger['gender'],
                    onChanged: (value) {
                      controller.updatePassengerGender(index, value!);
                    },
                  ),
                  const Text("Male"),
                  Radio<String>(
                    value: "Female",
                    groupValue: passenger['gender'],
                    onChanged: (value) {
                      controller.updatePassengerGender(index, value!);
                    },
                  ),
                  const Text("Female"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                controller.savePassengerDetails(index);
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 14.sp,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
