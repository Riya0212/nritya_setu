import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nritya_setu/components/form_utils.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isObscureText = true;

  handleOnLogin() {
    if (globalKey.currentState!.validate() == true) {
      log('valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Metrics.width(context) * 0.04),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors.marronBg,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponent(
                text: 'NRITYASETU',
                style: TextStyle(
                  color: colors.defaultWhite,
                  fontSize: Metrics.getFontSize(context, 28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextComponent(
                text: 'Login using your credentials',
                style: TextStyle(
                  color: colors.colorLightGrey,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
              ),
              SizedBox(height: Metrics.height(context) * 0.02),
              buildTextField(
                hint: 'Enter your username',
                context: context,
                title: 'Username',
                titleTextStyle: TextStyle(
                  color: colors.defaultWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
                keyboardType: TextInputType.text,
                validationLabel: 'name',
                controller: unameController,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'This field is required';
                  } else {
                    return null;
                  }
                },
                suffixIcon: Icon(Icons.person, color: colors.colorGrey),
              ),
              SizedBox(height: Metrics.height(context) * 0.02),

              buildTextField(
                hint: 'Enter your password',
                context: context,
                title: 'Password',
                titleTextStyle: TextStyle(
                  color: colors.defaultWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
                keyboardType: TextInputType.text,
                validationLabel: 'pass',
                controller: passController,
                obscureText: isObscureText,
                maxlines: 1,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'This field is required';
                  } else {
                    return null;
                  }
                },
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility,
                    color: colors.colorGrey,
                  ),
                ),
              ),
              SizedBox(height: Metrics.height(context) * 0.03),

              buildBtn(context: context, title: 'LOGIN', onTap: handleOnLogin),
            ],
          ),
        ),
      ),
    );
  }
}
