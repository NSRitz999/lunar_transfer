import 'package:lunar_transfer/app/app.dialogs.dart';
import 'package:lunar_transfer/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

extension DialogServiceExtension on DialogService {
  static bool _isLoading = false;

  void showLoadingDialog() {
    if (_isLoading) return;

    showCustomDialog(
      variant: DialogType.loading,
    );

    _isLoading = true;
  }

  void hideLoadingDialog() {
    if (!_isLoading) return;

    locator<NavigationService>().back();

    _isLoading = false;
  }
}
