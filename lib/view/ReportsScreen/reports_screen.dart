import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_textfield.dart';
import 'package:municipality_car_management_system/view/ReportsScreen/reports_details_screen.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        /// Filter with Date
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            spacing: 10,
            children: [
              /// Start Date
              Expanded(
                child: CommonTextField(
                  labelText: 'Start Date',
                  hintText: 'Start Date',
                  controller: TextEditingController(),
                  suffixIconData: Icons.calendar_month_rounded,
                  onTap: () {},
                ),
              ),

              /// End Date
              Expanded(
                child: CommonTextField(
                  labelText: 'End Date',
                  hintText: 'End Date',
                  controller: TextEditingController(),
                  suffixIconData: Icons.calendar_month_rounded,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),

        /// Filter with Search
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CommonTextField(
            labelText: 'Search Car Number',
            hintText: 'Search Car Number',
            controller: TextEditingController(),
          ),
        ),

        /// Items
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
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
                          "Number of Trip",
                          style: TextStyle(
                            color: AppColor.darkTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            color: AppColor.darkTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    CommonButton(
                      width: double.infinity,
                      buttonText: 'View Details',
                      buttonColor: AppColor.primaryColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportsDetailsScreen()));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
