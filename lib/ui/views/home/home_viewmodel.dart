import 'package:lunar_transfer/app/app.locator.dart';
import 'package:lunar_transfer/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  /// A callback that navigates to the [NetworkLoginView]
  Future<void> onBeginPressed() => _nav.replaceWithNetworkLoginView();
}
