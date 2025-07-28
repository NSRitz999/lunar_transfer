import 'package:lunar_transfer/app/app.extensions.dart';
import 'package:lunar_transfer/app/app.locator.dart';
import 'package:lunar_transfer/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool get isObscure => _isObscure;
  bool _isObscure = true;

  /// The host address to be connected
  String get hostAddr => _hostAddr;
  String _hostAddr = "";
  set hostAddr(String value) {
    _hostAddr = value;
    rebuildUi();
  }

  /// The domain address to be connected
  String get domainAddr => _domainAddr;
  String _domainAddr = "";
  set domainAddr(String value) {
    _domainAddr = value;
    rebuildUi();
  }

  /// The user's username
  String get username => _username;
  String _username = "";
  set username(String value) {
    _username = value;
    rebuildUi();
  }

  /// The user's password
  String get password => _password;
  String _password = "";
  set password(String value) {
    _password = value;
    rebuildUi();
  }

  void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    rebuildUi();
  }

  /// A callback that navigates to the [NetworkLoginView]
  Future<void> onBeginPressed() => _nav.replaceWithNetworkLoginView();

  Future<void> debugDialog() async {
    _dialogService.showLoadingDialog();

    await Future.delayed(const Duration(seconds: 3));

    _dialogService.hideLoadingDialog();
  }
}
