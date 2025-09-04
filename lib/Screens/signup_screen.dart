import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_health_monitoring_app/Provider/auth_provider.dart';
import 'package:soil_health_monitoring_app/Screens/login_screen.dart';
import 'package:soil_health_monitoring_app/Widgets/elevated_button.dart';
import 'package:soil_health_monitoring_app/Widgets/form_text_field.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> signup(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.signup(
      email.text.trim(),
      password.text.trim(),
    );
    if (result && context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
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
                "Create Account",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),
              FormTextField(controller: name, label: "Name", validator: (String? value) { 
                if(value == null || value.trim().isEmpty){
                  return "Name is required";
                }
               },),
              const SizedBox(height: 16),
              FormTextField(controller: email, label: "Email", validator: (String? value) { 
                if(value == null || value.trim().isEmpty){
                  return "Email is required";
               }
  }),
              const SizedBox(height: 16),
              FormTextField(controller: password, label: "Password", validator: (String? value) {  
                if(value == null || value.trim().isEmpty){
                  return "Password is required";
                }
              },),
              const SizedBox(height: 30),
              Elevatedbutton(onPressed: authProvider.isLoading ? null : ()=> signup(context), text: 'Sign Up'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text(
                  "Already have an account? Login",
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
