import 'package:flutter/material.dart';
import 'package:profile_solutaion/model/user_model.dart';
import 'package:profile_solutaion/profile/user_page.dart';
import 'package:profile_solutaion/service/user_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Profile Card',
      home: Scaffold(
        appBar: AppBar(title: Text('Animated Profile Card')),
        body: FutureBuilder<User>(
          future: _userService.fetchRandomUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching user'));
            } else {
              return Center(child: ProfileCard(user: snapshot.data!));
            }
          },
        ),
      ),
    );
  }
}
