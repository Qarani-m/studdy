import 'package:flutter/material.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavigation(initialIndex: 3,),
  
  
      body: Center(child: Text("Profile"),),
    );
  }
}