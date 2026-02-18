import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton()
class FactSharesStorage {
  FactSharesStorage();
  
  static const _baseDirName = 'Denwee';
  static const _shareDirName = 'shares';

  Directory? _dir;

  Future<File> save(Uint8List bytes) async {
    final dir = await getDirectory();
    final fileName = 'fact_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<Directory> getDirectory() async {
    if (_dir != null) {
      return _dir!;
    }
    
    final base = await getTemporaryDirectory();
    final path = '${base.path}/$_baseDirName/$_shareDirName';
    final denweeDir = Directory(path);

    if (!await denweeDir.exists()) {
      await denweeDir.create(recursive: true);
    }

    _dir = denweeDir;
    return denweeDir;
  }

  Future<void> clear() async {
    final dir = await getDirectory();
    if (!await dir.exists()) {
      return;
    }

    final files = dir.listSync();

    for (final f in files) {
      if (f is File) {
        try {
          await f.delete();
        } catch (_) {
          continue;
        }
      }
    }
  }
}
