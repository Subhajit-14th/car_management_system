import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/vehicle_journey_history_provider.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';
import 'package:provider/provider.dart';

class VehicleJourneyHistoryScreen extends StatefulWidget {
  const VehicleJourneyHistoryScreen({super.key});

  @override
  State<VehicleJourneyHistoryScreen> createState() =>
      _VehicleJourneyHistoryScreenState();
}

class _VehicleJourneyHistoryScreenState
    extends State<VehicleJourneyHistoryScreen> {
  @override
  void initState() {
    super.initState();

    /// ✅ Call API once when the widget initializes
    Future.microtask(() {
      Provider.of<VehicleJourneyHistoryProvider>(context, listen: false)
          .getVehicleHistory(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<VehicleJourneyHistoryProvider>(
        builder: (context, vehicleJourneyProvider, child) {
      if (vehicleJourneyProvider.isDataLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      }

      // ✅ Check if data is empty
      if (vehicleJourneyProvider.vehicleJourneyHistroryApiResModel.record ==
              null ||
          vehicleJourneyProvider
              .vehicleJourneyHistroryApiResModel.record!.isEmpty) {
        return const Center(
          child: Text("No data found!"),
        );
      }

      return ListView.builder(
        itemCount: vehicleJourneyProvider
            .vehicleJourneyHistroryApiResModel.record?.length,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final record = vehicleJourneyProvider
              .vehicleJourneyHistroryApiResModel.record![index];

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
                _buildInfoRow("Vehicle Number", record.vehicleNo ?? ''),
                SizedBox(height: height * 0.01),
                _buildInfoRow("Word Number", record.wardNo ?? ''),
                SizedBox(height: height * 0.01),
                _buildInfoRow("Driver Name", record.driverName ?? ''),
                SizedBox(height: height * 0.01),
                _buildInfoRow("Workers Name", record.workersName ?? ''),
                SizedBox(height: height * 0.02),
                CommonButton(
                  width: double.infinity,
                  buttonText: 'Return',
                  buttonColor: AppColor.primaryColor,
                  onTap: () {
                    context
                        .read<VehicleJourneyHistoryProvider>()
                        .updateVehicleHistory(
                            context, "${record.id}", "${record.vehicleNo}");
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  /// Helper method to build row
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColor.darkTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColor.darkTextColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
