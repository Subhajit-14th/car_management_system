import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/vehicle_journey_entry_provider.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_textfield.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Vehicle Number Field
          CommonTextField(
            controller:
                context.read<VehicleJourneyEntryProvider>().vehicleNumber,
            labelText: 'Vehicle Number',
            hintText: 'Vehicle Number',
            onTap: () {
              _showVehicleNumberModal(context);
            },
          ),
          SizedBox(height: height * 0.02),

          /// Word No Field
          CommonTextField(
            labelText: 'Word No',
            hintText: "Word No",
            controller: context.read<VehicleJourneyEntryProvider>().wordNo,
            onTap: () {
              _showWordNoModal(context);
            },
          ),
          SizedBox(height: height * 0.02),

          /// Driver Name Field
          CommonTextField(
            labelText: 'Driver Name',
            hintText: "Driver Name",
            controller: context.read<VehicleJourneyEntryProvider>().driverName,
            onTap: () {},
          ),
          SizedBox(height: height * 0.02),

          /// Workers Name
          CommonTextField(
            labelText: 'Workers Name',
            hintText: "Workers Name",
            controller: context.read<VehicleJourneyEntryProvider>().workersName,
            onTap: () {
              _showWorkersNameModal(context);
            },
          ),
          SizedBox(height: height * 0.02),

          /// Submit Button
          CommonButton(
            width: double.infinity,
            buttonText: 'Submit',
            buttonColor: AppColor.primaryColor,
          ),
        ],
      ),
    );
  }

  /// Vehicle Number Bottom Sheet
  void _showVehicleNumberModal(BuildContext context) {
    final vehicleProvider = context.read<VehicleJourneyEntryProvider>();
    vehicleProvider.getVehicleNumberList(context); // Fetch word number list
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: AppColor.secondaryColor,
      builder: (BuildContext context) {
        return Consumer<VehicleJourneyEntryProvider>(
          builder: (context, vehicleProvider, _) {
            if (vehicleProvider.vehicleNumberList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 18),
                  child: Text(
                    'Vehicle Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: vehicleProvider.vehicleNumberList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) {
                    final vehicleRecord =
                        vehicleProvider.vehicleNumberList[index];
                    return ListTile(
                      title: Text(
                        vehicleRecord.vehicleNo ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        vehicleProvider.vehicleNumber.text =
                            vehicleRecord.vehicleNo ?? '';
                        vehicleProvider.setSelectedVehicle(vehicleRecord);
                        Navigator.pop(context); // Close the modal
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Word No Modal Bottom Sheet
  void _showWordNoModal(BuildContext context) {
    final vehicleProvider = context.read<VehicleJourneyEntryProvider>();
    vehicleProvider.getWordNo(context); // Fetch word number list
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: AppColor.secondaryColor,
      builder: (BuildContext context) {
        return Consumer<VehicleJourneyEntryProvider>(
          builder: (context, vehicleProvider, _) {
            if (vehicleProvider.wordNoList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 18),
                  child: Text(
                    'Word No',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: vehicleProvider.wordNoList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) {
                    final wordNoRecord = vehicleProvider.wordNoList[index];
                    return ListTile(
                      title: Text(
                        wordNoRecord.wardno ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        vehicleProvider.wordNo.text = wordNoRecord.wardno ?? '';
                        vehicleProvider.setSelectedWordNo(wordNoRecord);
                        Navigator.pop(context); // Close the modal
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Word No Modal Bottom Sheet
  void _showWorkersNameModal(BuildContext context) {
    final vehicleProvider = context.read<VehicleJourneyEntryProvider>();
    vehicleProvider.getWorkersNameList(context); // Fetch word number list
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: AppColor.secondaryColor,
      builder: (BuildContext context) {
        return Consumer<VehicleJourneyEntryProvider>(
          builder: (context, vehicleProvider, _) {
            if (vehicleProvider.workersNameList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 18),
                  child: Text(
                    'Workers Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: vehicleProvider.workersNameList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) {
                    final workersName = vehicleProvider.workersNameList[index];
                    return ListTile(
                      title: Text(
                        workersName.workersname ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        vehicleProvider.workersName.text =
                            workersName.workersname ?? '';
                        vehicleProvider.setSelectedWorkersName(workersName);
                        Navigator.pop(context); // Close the modal
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
