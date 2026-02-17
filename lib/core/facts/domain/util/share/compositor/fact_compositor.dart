import 'dart:io';
import 'dart:typed_data';

abstract class FactCompositor {
  Future<File> compose(Uint8List overlay);
}
