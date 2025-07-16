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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Lunar Transfer",
                style: context.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Center(
                child: Image.asset(
                  "assets/images/moon-logo.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "This is a simple demo application that can enable users to transfer files between local network folders and your mobile phone!",
                style: context.body,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              FtkButton(
                text: "Begin",
                onPressed: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
