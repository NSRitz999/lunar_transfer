import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';
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
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFF1EBDD),
              borderRadius: BorderRadius.circular(32),
              border: BoxBorder.all(width: 4),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 4),
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
