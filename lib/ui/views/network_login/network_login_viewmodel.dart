import 'dart:convert';
import 'dart:typed_data';

import 'package:lunar_transfer/app/app.locator.dart';
import 'package:lunar_transfer/app/app.logger.dart';
import 'package:lunar_transfer/app/app.router.dart';
import 'package:lunar_transfer/services/smb_service.dart';
import 'package:smb_connect/smb_connect.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkLoginViewModel extends BaseViewModel {
  final _log = getLogger("NetworkLoginViewModel");
  late final _smbService = locator<SmbService>();
  late final _nav = locator<NavigationService>();

  SmbConnect? _connection;

  /// The network address the user is trying to access
  String get networkAddr => _networkAddr;
  String _networkAddr = "";
  set networkAddr(String value) {
    _networkAddr = value;
    rebuildUi();
  }

  /// The domain address the user is trying to access
  String get domainAddr => _domainAddr;
  String _domainAddr = "";
  set domainAddr(String value) {
    _domainAddr = value;
    rebuildUi();
  }

  /// The username credential for accessing the network
  String get username => _username;
  String _username = "";
  set username(String value) {
    _username = value;
    rebuildUi();
  }

  /// The password credential for accessing the network
  String get password => _password;
  String _password = "";
  set password(String value) {
    _password = value;
    rebuildUi();
  }

  Future<void> onConnect() async {
    final result = await _smbService.connectToNetwork(
      host: networkAddr,
      domain: domainAddr,
      username: username,
      password: password,
    );

    if (result.isFailure) {
      return;
    }

    await _nav.replaceWithNetworkFolderView();
  }

  Future<void> closeConnection() async {
    try {
      final connection = _connection;

      if (connection == null) return;
      await connection.close();

      _connection = null;
      _log.i("Connection closed successfully!");
    } catch (e, s) {
      _log.e("Error: $e", stackTrace: s);
    }
  }

  Future<void> listAvailableFiles() async {
    try {
      final connection = _connection;

      if (connection == null) return;

      final folder = await connection.file("/debug-network-folder");
      List<SmbFile> files = await connection.listFiles(folder);

      Stream<Uint8List> reader = await connection.openRead(files.first);
      var s = await reader.asyncMap((event) => utf8.decode(event)).join("");

      _log.i("Retrieved Data: $s");
    } catch (e, s) {
      _log.e("Error: $e", stackTrace: s);
    }
  }
}
