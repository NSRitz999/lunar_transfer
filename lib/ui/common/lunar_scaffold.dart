import 'package:flutter/material.dart';

class LunarScaffold extends StatelessWidget {
  const LunarScaffold({
    super.key,
    required this.body,
    this.appBar,
  });

  /// The body to be displayed within the scaffold
  final Widget body;

  /// The [AppBar] to be displayed in the scaffold
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 32,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
