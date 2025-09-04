import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_health_monitoring_app/Provider/auth_provider.dart';
import 'package:soil_health_monitoring_app/Screens/home_screen.dart';
import 'package:soil_health_monitoring_app/Screens/signup_screen.dart';
import 'package:soil_health_monitoring_app/Widgets/elevated_button.dart';
import 'package:soil_health_monitoring_app/Widgets/form_text_field.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final success = await authProvider.login(
        email.text.trim(),
        password.text.trim(),
      );

      if (success && context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 16),
              FormTextField(controller: email, label: "Email", validator: (String? value) { 
               if(value == null || value.trim().isEmpty){
                  return 'Email is wrong!!';
               }
               },),
              const SizedBox(height: 16),
              FormTextField(controller: password, label: "Password", validator: (String? value) {
                if(value == null || value.trim().isEmpty){
                  return 'Password is wrong!!';
               }
                },),
              const SizedBox(height: 30),
              Elevatedbutton(
                onPressed: () => authProvider.isLoading ? null : login(context),
                text: 'LOGIN',
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child: Text(
                  "New User? Register Yourself",
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
