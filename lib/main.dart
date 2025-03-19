import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/auth_providers.dart';
import 'package:municipality_car_management_system/providers/screen_route_provider.dart';
import 'package:municipality_car_management_system/providers/vehicle_journey_entry_provider.dart';
import 'package:municipality_car_management_system/services/dependency_services.dart';
import 'package:municipality_car_management_system/services/hive_services.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/view/Authentication/login_screen.dart';
import 'package:municipality_car_management_system/view/root_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// set dependency injection
  setupServiceLocator();

  /// initialize Hive data base
  await HiveDatabase.initializeHive();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProviders()),
        ChangeNotifierProvider(create: (context) => ScreenRouteProvider()),
        ChangeNotifierProvider(
            create: (context) => VehicleJourneyEntryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, authProviders, child) {
      return MaterialApp(
        title: 'Car Management System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        home: authProviders.isAuthenticated ? RootScreen() : LoginScreen(),
      );
    });
  }
}
