import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/providers/auth_providers.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_button.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_passwordfield.dart';
import 'package:municipality_car_management_system/utlis/widgets/common_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: context.read<AuthProviders>().phoneNumberController,
                labelText: 'Phone Number',
                hintText: 'Phone Number',
              ),
              const SizedBox(height: 16),
              CommonPasswordField(
                controller: context.read<AuthProviders>().passwordController,
                labelText: 'Password',
                hintText: 'Password',
              ),
              const SizedBox(height: 20),
              Consumer<AuthProviders>(builder: (context, value, child) {
                return value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                    : CommonButton(
                        buttonText: 'Login',
                        buttonColor: AppColor.primaryColor,
                        height: 50,
                        width: double.infinity,
                        onTap: () {
                          value.login(context);
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
