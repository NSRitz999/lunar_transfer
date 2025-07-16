import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Text(
              "Hello, World",
              style: context.title,
            ),
            const SizedBox(height: 16),
            Text(
              "This is the HomeView of the app template. If you want to change this to a different view, edit the 'initialRoute' option in the MaterialApp constructor in app.dart. Have Fun :D",
              style: context.body.semiBold,
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
