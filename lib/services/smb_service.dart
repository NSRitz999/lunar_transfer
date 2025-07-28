import 'dart:typed_data';

import 'package:lunar_transfer/app/app.logger.dart';
import 'package:lunar_transfer/common/result.dart';
import 'package:smb_connect/smb_connect.dart';

class SmbService {
  final _log = getLogger("SmbService");

  SmbConnect? get connection => _connection;
  SmbConnect? _connection;

  bool get isConnectionActive => connection != null;

  /// Securely connects to a network with auth credentials
  Future<Result<SmbConnect, void>> connectToNetwork({
    required String host,
    required String domain,
    required String username,
    required String password,
  }) async {
    try {
      final connection = await SmbConnect.connectAuth(
        host: host,
        username: username,
        password: password,
        domain: domain,
      );

      _log.i("Successfully connected to $host!");
      _connection = connection;

      return Result.success(connection);
    } catch (e, s) {
      return _logAndFail(e, s);
    }
  }

  /// Closes the current active connection
  Future<Result<void, void>> closeConnection() async {
    try {
      if (!isConnectionActive) {
        return const Result.success(null);
      }

      await _connection?.close();

      return const Result.success(null);
    } catch (e, s) {
      return _logAndFail(e, s);
    }
  }

  /// Returns a list of available [SmbFile]s from a given path.
  Future<Result<List<SmbFile>?, void>> listFilesFromPath(String path) async {
    if (!isConnectionActive) return const Result.failure(null);

    try {
      final folder = await _connection?.file(path);
      if (folder == null) return const Result.failure(null);

      final files = await _connection?.listFiles(folder);

      return Result.success(files);
    } catch (e, s) {
      return _logAndFail(e, s);
    }
  }

  /// Downloads the raw data for a given file
  Future<Result<Uint8List?, void>> downloadFile(SmbFile file) async {
    if (!isConnectionActive) return const Result.failure(null);

    try {
      final reader = await _connection?.openRead(file);

      if (reader == null) return const Result.success(null);

      final builder = BytesBuilder(copy: false);
      await for (final chunk in reader) {
        builder.add(chunk);
      }

      return Result.success(builder.toBytes());
    } catch (e, s) {
      return _logAndFail(e, s);
    }
  }

  Result<T, void> _logAndFail<T>(Object e, StackTrace s) {
    _log.e(e.toString(), stackTrace: s);
    return const Result.failure(null);
  }
}
