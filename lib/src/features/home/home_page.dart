import 'package:flutter/material.dart';
import 'package:studdy/src/repository/auth_repo/auth_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed:(){
          AuthRepo.instance.signoutUser();
        } 
        , child: Text("kllklklkk")),
      ),
    );
  }
}