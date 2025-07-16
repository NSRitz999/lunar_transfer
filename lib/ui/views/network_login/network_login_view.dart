import 'package:flutter/material.dart';
import 'package:ftk_template_app/app/app.theme.dart';
import 'package:ftk_ui/ftk_ui.dart';
import 'package:stacked/stacked.dart';

import 'network_login_viewmodel.dart';

class NetworkLoginView extends StackedView<NetworkLoginViewModel> {
  const NetworkLoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NetworkLoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/moon-logo.png",
                  width: 100,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Network Address",
                style: context.subtitle,
              ),
              FtkTextField(
                onChanged: (e) => viewModel.networkAddr = e,
                backgroundColor: LunarPalette.darkWidget,
              ),
              const SizedBox(height: 16),
              Text(
                "Domain Address",
                style: context.subtitle,
              ),
              FtkTextField(
                onChanged: (e) => viewModel.domainAddr = e,
                backgroundColor: LunarPalette.darkWidget,
              ),
              const SizedBox(height: 16),
              Text(
                "Username",
                style: context.subtitle,
              ),
              FtkTextField(
                onChanged: (e) => viewModel.username = e,
                backgroundColor: LunarPalette.darkWidget,
              ),
              const SizedBox(height: 16),
              Text(
                "Password",
                style: context.subtitle,
              ),
              FtkTextField(
                onChanged: (e) => viewModel.password = e,
                backgroundColor: LunarPalette.darkWidget,
              ),
              const SizedBox(height: 32),
              FtkButton(
                text: "Connect",
                buttonColor: LunarPalette.green,
                onPressed: viewModel.onConnect,
              ),
              const SizedBox(height: 16),
              FtkButton(
                text: "Cancel",
                buttonColor: LunarPalette.red,
                onPressed: viewModel.closeConnection,
              ),
              const SizedBox(height: 16),
              FtkButton(
                text: "List Shares",
                buttonColor: LunarPalette.lightBlue,
                onPressed: viewModel.listAvailableFiles,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  NetworkLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NetworkLoginViewModel();
}
