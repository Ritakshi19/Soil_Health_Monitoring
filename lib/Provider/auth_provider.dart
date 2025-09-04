import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soil_health_monitoring_app/Services/auth_service.dart';

class AuthProvider extends ChangeNotifier{
  final Authservice authService =Authservice();
  User? _user;
  bool _isLoading =false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  AuthProvider() {
    authService.authStateChanges.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> signup(String email, String password) async {
      _isLoading = true;
      notifyListeners();
      _user = await authService.signup(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
  }

  Future<bool> login(String email, String password) async {
      _isLoading = true;
      notifyListeners();
      _user = await authService.login(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
  }
}