import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _error;
  String? _email;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get userEmail => _email;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final success = await _authService.login(email, password);
      if (success) {
        _isAuthenticated = true;
        _email = email;
      } else {
        _error = 'Invalid email or password';
      }
    } catch (e) {
      _error = 'Authentication failed. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final success = await _authService.signup(email, password);
      if (success) {
        _isAuthenticated = true;
        _email = email;
      } else {
        _error = 'Email already exists';
      }
    } catch (e) {
      _error = 'Registration failed. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    _email = null;
    notifyListeners();
  }
}
