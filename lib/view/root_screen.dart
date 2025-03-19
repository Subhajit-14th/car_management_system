import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/screen_route_provider.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/view/HomeScreen/home_screen.dart';
import 'package:municipality_car_management_system/view/ReportsScreen/reports_screen.dart';
import 'package:municipality_car_management_system/view/VehicleJourneyHistory/vehicle_journey_history_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        title: Consumer<ScreenRouteProvider>(
            builder: (context, screenRouteProvider, child) {
          return Text(
            screenRouteProvider.screenRoutes[screenRouteProvider.selectedIndex],
            style: TextStyle(
              color: AppColor.darkTextColor,
            ),
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.secondaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.darkTextColor.withAlpha(40),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColor.primaryColor,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColor.secondaryColor,
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColor.darkTextColor,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    "Dev User",
                    style: TextStyle(
                      color: AppColor.darkTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Vichcle Journey Entry",
                style: TextStyle(
                  color: context.watch<ScreenRouteProvider>().selectedIndex == 0
                      ? AppColor.lightTextColor
                      : AppColor.darkTextColor,
                ),
              ),
              tileColor: context.watch<ScreenRouteProvider>().selectedIndex == 0
                  ? AppColor.primaryColor
                  : null,
              onTap: () {
                Navigator.pop(context);
                context.read<ScreenRouteProvider>().setIndex(0);
              },
            ),
            ListTile(
              title: Text(
                "Vichcle Journey History",
                style: TextStyle(
                  color: context.watch<ScreenRouteProvider>().selectedIndex == 1
                      ? AppColor.lightTextColor
                      : AppColor.darkTextColor,
                ),
              ),
              tileColor: context.watch<ScreenRouteProvider>().selectedIndex == 1
                  ? AppColor.primaryColor
                  : null,
              onTap: () {
                Navigator.pop(context);
                context.read<ScreenRouteProvider>().setIndex(1);
              },
            ),
            ListTile(
              title: Text(
                "Reports",
                style: TextStyle(
                  color: context.watch<ScreenRouteProvider>().selectedIndex == 2
                      ? AppColor.lightTextColor
                      : AppColor.darkTextColor,
                ),
              ),
              tileColor: context.watch<ScreenRouteProvider>().selectedIndex == 2
                  ? AppColor.primaryColor
                  : null,
              onTap: () {
                Navigator.pop(context);
                context.read<ScreenRouteProvider>().setIndex(2);
              },
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                  color: context.watch<ScreenRouteProvider>().selectedIndex == 3
                      ? AppColor.lightTextColor
                      : AppColor.darkTextColor,
                ),
              ),
              tileColor: context.watch<ScreenRouteProvider>().selectedIndex == 3
                  ? AppColor.primaryColor
                  : null,
              onTap: () {
                Navigator.pop(context);
                context.read<ScreenRouteProvider>().setIndex(3);
              },
            ),
          ],
        ),
      ),
      body: [
        HomeScreen(),
        VehicleJourneyHistoryScreen(),
        ReportsScreen(),
        Container(
          color: Colors.blue,
        ),
      ][context.watch<ScreenRouteProvider>().selectedIndex],
    );
  }
}
