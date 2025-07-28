import 'package:lunar_transfer/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:lunar_transfer/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:lunar_transfer/ui/views/home/home_view.dart';
import 'package:lunar_transfer/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:lunar_transfer/ui/views/network_login/network_login_view.dart';
import 'package:lunar_transfer/ui/views/network_folder/network_folder_view.dart';
import 'package:lunar_transfer/services/smb_service.dart';
import 'package:lunar_transfer/ui/dialogs/loading/loading_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: NetworkLoginView),
    MaterialRoute(page: NetworkFolderView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SmbService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: LoadingDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
