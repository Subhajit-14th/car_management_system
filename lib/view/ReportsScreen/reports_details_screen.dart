import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';

class ReportsDetailsScreen extends StatelessWidget {
  const ReportsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reprts Details',
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColor.darkTextColor.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Heading
                Text(
                  'Trip Details ${index + 1}',
                  style: TextStyle(
                    color: AppColor.darkTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.02),
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
                      "Driver Name",
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Jhon Dhoe",
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
                      "Date",
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "12/05/2025",
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
                      "Word No",
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "12",
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
                      "Labour Name",
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Labour One, Labour Two",
                      style: TextStyle(
                        color: AppColor.darkTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          );
        },
      ),
    );
  }
}
