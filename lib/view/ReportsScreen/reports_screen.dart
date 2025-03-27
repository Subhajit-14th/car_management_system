import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/reports_provider.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_textfield.dart';
import 'package:municipality_car_management_system/view/ReportsScreen/reports_details_screen.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  void initState() {
    super.initState();

    /// ✅ Call API once when the widget initializes
    Future.microtask(() {
      Provider.of<ReportsProvider>(context, listen: false)
          .getReportsList(context);
    });
  }

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
                  controller:
                      context.read<ReportsProvider>().startDateController,
                  suffixIconData: Icons.calendar_month_rounded,
                  onTap: () {
                    context.read<ReportsProvider>().selectDate(
                          context,
                          context.read<ReportsProvider>().startDateController,
                        );
                  },
                ),
              ),

              /// End Date
              Expanded(
                child: CommonTextField(
                  labelText: 'End Date',
                  hintText: 'End Date',
                  controller: context.read<ReportsProvider>().endDateController,
                  suffixIconData: Icons.calendar_month_rounded,
                  onTap: () {
                    context.read<ReportsProvider>().selectDate(
                          context,
                          context.read<ReportsProvider>().endDateController,
                        );
                  },
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
            controller: context.read<ReportsProvider>().searchController,
            onChanged: (value) {
              context.read<ReportsProvider>().filterReports(value);
            },
          ),
        ),

        /// Items
        Consumer<ReportsProvider>(builder: (context, reportsProvider, child) {
          if (reportsProvider.isDataLoading) {
            return SizedBox(
              height: height * 0.05,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              ),
            );
          }

          // ✅ Check if data is empty
          if (reportsProvider.reportsApiResModel.record == null ||
              reportsProvider.reportsApiResModel.record!.isEmpty) {
            return const Center(
              child: Text("No data found!"),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: reportsProvider.repostList.length,
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
                            "${reportsProvider.repostList[index].vehicleNo}",
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
                            "${reportsProvider.repostList[index].driverName}",
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
                            "${reportsProvider.repostList[index].date}",
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
                            "${reportsProvider.repostList[index].count}",
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
                                  builder: (context) => ReportsDetailsScreen(
                                        vehicleNo:
                                            "${reportsProvider.repostList[index].vehicleNo}",
                                      )));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
