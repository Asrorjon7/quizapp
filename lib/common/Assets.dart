abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();

// ignore: library_private_types_in_public_api
// static _Audios get audios => const _Audios();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get arrow => "$basePath/arrow.svg";
  String get logout => "$basePath/logout.svg";
  String get retry => "$basePath/retry.svg";

}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');


// String get logo => "$basePath/logo.png";
}

// class _Audios extends _AssetsHolder {
//   const _Audios() : super('audio');
// }
