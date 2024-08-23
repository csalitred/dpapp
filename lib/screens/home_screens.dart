import 'package:flutter/material.dart';
import 'package:dpapp/components/header_view.dart';
import 'package:dpapp/components/temperature_view.dart';
import 'package:dpapp/components/home_service_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: HeaderView(),
                    ),
                    Expanded(
                      flex: 3,
                      child: HomeServiceView(),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: TemeratureView()),
            ],
          ),
        ),
      ),
    );
  }
}
