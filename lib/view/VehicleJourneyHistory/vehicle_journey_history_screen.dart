import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';

class VehicleJourneyHistoryScreen extends StatelessWidget {
  const VehicleJourneyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.darkTextColor.withAlpha(50),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vehicle Number",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "WB 56F 0005",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Word Number",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "06",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Driver Name",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Workers Name",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CommonButton(
                width: double.infinity,
                buttonText: 'Return',
                buttonColor: AppColor.primaryColor,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
