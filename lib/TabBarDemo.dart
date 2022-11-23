import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget{
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learning Tab Bar'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.male),text: 'Male'),
            Tab(icon: Icon(Icons.female),text: 'Female'),
            Tab(icon: Icon(Icons.child_care),text: 'Child')
          ]),
        ),
        body:  TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.male),
                  Text('This is tab referring to males')
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.female),
                  Text('This is tab referring to females')
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.child_care),
                  Text('This is tab referring to children')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
}