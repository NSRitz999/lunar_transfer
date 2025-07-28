import 'package:flutter/material.dart';
import 'package:lunar_transfer/app/app.theme.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'loading_dialog_model.dart';

class LoadingDialog extends StackedView<LoadingDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoadingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoadingDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: LunarPalette.eggWhite,
            boxShadow: LunarTheme.shadows,
            border: Border.all(
              width: 4,
              color: LunarPalette.black,
            ),
            borderRadius: LunarTheme.defaultBorderRadius,
          ),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.square(
                dimension: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  strokeCap: StrokeCap.round,
                  color: LunarPalette.black,
                ),
              ),
              Icon(
                Icons.rocket_launch,
                size: 48,
                color: LunarPalette.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoadingDialogModel viewModelBuilder(BuildContext context) =>
      LoadingDialogModel();
}
