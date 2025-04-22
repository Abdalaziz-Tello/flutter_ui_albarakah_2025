import 'package:animation_session/view/product_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User  extends Equatable{
  String name;
  User({required this.name});

  @override
  String toString() {
    return name
;  }

  @override
  // TODO: implement props
  List<Object?> get props => [name];


}

void main() {
  User user =User(name: "A");
  User user1= User(name: "A");

  Set<User> users = {};
  users.add(user);
  users.add(user1);
  print(users);
   runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
    );
  }
}