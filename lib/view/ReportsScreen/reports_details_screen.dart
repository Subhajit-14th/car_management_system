import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/reports_provider.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:provider/provider.dart';

class ReportsDetailsScreen extends StatefulWidget {
  const ReportsDetailsScreen({super.key, required this.vehicleNo});
  final String vehicleNo;

  @override
  State<ReportsDetailsScreen> createState() => _ReportsDetailsScreenState();
}

class _ReportsDetailsScreenState extends State<ReportsDetailsScreen> {
  @override
  void initState() {
    super.initState();

    /// ✅ Call API once when the widget initializes
    Future.microtask(() {
      Provider.of<ReportsProvider>(context, listen: false)
          .getReportDetails(context, widget.vehicleNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reprts Details',
        ),
      ),
      body: context.watch<ReportsProvider>().isDataLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Vehicle No: ${context.read<ReportsProvider>().reportDetailsApiResModel.vehicleDetails?.vehicleNo}',
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Total Trip: ${context.read<ReportsProvider>().reportDetailsApiResModel.vehicleDetails?.tripCount}',
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: context
                        .read<ReportsProvider>()
                        .reportDetailsApiResModel
                        .record
                        ?.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    physics: const BouncingScrollPhysics(),
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
                                  "${context.read<ReportsProvider>().reportDetailsApiResModel.record?[index].vehicleNo}",
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
                                  "${context.read<ReportsProvider>().reportDetailsApiResModel.record?[index].driverName}",
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
                                  "${context.read<ReportsProvider>().reportDetailsApiResModel.record?[index].date}",
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
                                  "${context.read<ReportsProvider>().reportDetailsApiResModel.record?[index].wardNo}",
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
                                  "${context.read<ReportsProvider>().reportDetailsApiResModel.record?[index].workersName}",
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
                ),
              ],
            ),
    );
  }
}
