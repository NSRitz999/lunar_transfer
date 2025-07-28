import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';
import 'package:lunar_transfer/app/app.theme.dart';
import 'package:lunar_transfer/ui/common/lunar_button.dart';
import 'package:lunar_transfer/ui/common/lunar_card.dart';
import 'package:lunar_transfer/ui/common/lunar_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return LunarScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Lunar Transfer",
            style: context.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          LunarCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Host Address",
                  style: context.subtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: LunarTheme.shadows,
                  ),
                  child: FtkTextField(
                    backgroundColor: LunarPalette.eggWhite,
                    inputBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onChanged: (e) => viewModel.hostAddr = e,
                  ),
                ),
                const SizedBox(height: 4),
                const Text("Example: 192.XXX.YYY.ZZZ"),
                const SizedBox(height: 16),
                Text(
                  "Domain Address",
                  style: context.subtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: LunarTheme.shadows,
                  ),
                  child: FtkTextField(
                    backgroundColor: LunarPalette.eggWhite,
                    inputBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onChanged: (e) => viewModel.domainAddr = e,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Username",
                  style: context.subtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: LunarTheme.shadows,
                  ),
                  child: FtkTextField(
                    backgroundColor: LunarPalette.eggWhite,
                    inputBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onChanged: (e) => viewModel.username = e,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Password",
                  style: context.subtitle,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: LunarTheme.shadows,
                  ),
                  child: FtkTextField(
                    icon: IconButton(
                      onPressed: viewModel.togglePasswordVisibility,
                      icon: Icon(
                        !viewModel.isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    backgroundColor: LunarPalette.eggWhite,
                    inputBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    obscureText: viewModel.isObscure,
                    onChanged: (e) => viewModel.password = e,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LunarButton(
                      text: "Connect",
                      onPressed: viewModel.debugDialog,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
