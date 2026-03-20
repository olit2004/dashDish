import 'dart:async';

class AuthService {
  // Simulated database
  final List<Map<String, String>> _users = [
    {'email': 'test@example.com', 'password': 'password123'}
  ];

  Future<bool> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Check if user exists
    return _users.any((user) => user['email'] == email && user['password'] == password);
  }

  Future<bool> signup(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Simple validation
    if (_users.any((u) => u['email'] == email)) {
      return false;
    }
    
    _users.add({'email': email, 'password': password});
    return true;
  }
}
