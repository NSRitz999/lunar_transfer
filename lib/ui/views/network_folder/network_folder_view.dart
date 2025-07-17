import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';
import 'package:stacked/stacked.dart';

import 'network_folder_viewmodel.dart';

class NetworkFolderView extends StackedView<NetworkFolderViewModel> {
  const NetworkFolderView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NetworkFolderViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Network Folder View",
                style: context.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  NetworkFolderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NetworkFolderViewModel();
}
