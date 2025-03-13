// ignore_for_file: provide_deprecation_message, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  const Assets._();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsNavGen get nav => const $AssetsIconsNavGen();
  $AssetsIconsSettingGen get settings => const $AssetsIconsSettingGen();
  $AssetsIconsPayGen get payment => const $AssetsIconsPayGen();

  SvgGenImage get reduceQuantity => const SvgGenImage('assets/icons/reduce_quantity.svg');
  SvgGenImage get addQuantity => const SvgGenImage('assets/icons/add_quantity.svg');
  SvgGenImage get plus => const SvgGenImage('assets/icons/plus.svg');
  SvgGenImage get delete => const SvgGenImage('assets/icons/delete.svg');
  SvgGenImage get edit => const SvgGenImage('assets/icons/edit.svg');

}

class $AssetsIconsNavGen {
  const $AssetsIconsNavGen();

  /// File path: assets/icons/nav/history.svg
  SvgGenImage get history => const SvgGenImage('assets/icons/nav/history.svg');

  /// File path: assets/icons/nav/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/nav/home.svg');

  /// File path: assets/icons/nav/scan.svg
  SvgGenImage get scan => const SvgGenImage('assets/icons/nav/scan.svg');

  /// File path: assets/icons/nav/setting.svg
  SvgGenImage get setting => const SvgGenImage('assets/icons/nav/setting.svg');

  /// File path: assets/icons/nav/ticket.svg
  SvgGenImage get ticket => const SvgGenImage('assets/icons/nav/ticket.svg');

  

  /// List of all assets
  List<SvgGenImage> get values => [history, home, scan, setting, ticket];
}

class $AssetsIconsSettingGen {
  const $AssetsIconsSettingGen();

  /// File path: assets/icons/nav/history.svg
  SvgGenImage get logout => const SvgGenImage('assets/icons/settings/logout.svg');
  SvgGenImage get printer => const SvgGenImage('assets/icons/settings/printer.svg');
  SvgGenImage get syncData => const SvgGenImage('assets/icons/settings/sync-data.svg');

  /// List of all assets
  List<SvgGenImage> get values => [logout, printer, syncData];
}

class $AssetsIconsPayGen {
  const $AssetsIconsPayGen();

  /// File path: assets/icons/nav/history.svg
  SvgGenImage get qris => const SvgGenImage('assets/icons/payment/qris.svg');
  SvgGenImage get transfer => const SvgGenImage('assets/icons/payment/transfer.svg');
  SvgGenImage get tunai => const SvgGenImage('assets/icons/payment/tunai.svg');

  /// List of all assets
  List<SvgGenImage> get values => [qris, transfer, tunai];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImages get logoAppBlue =>
      const AssetGenImages('assets/images/logo_blue.png');

  AssetGenImages get logoAppWhite =>
      const AssetGenImages('assets/images/logo_white.png');

  AssetGenImages get logoIdn =>
      const AssetGenImages('assets/images/logo_idn.png');

  AssetGenImages get back =>
      const AssetGenImages('assets/images/back.png');

  AssetGenImages get receiptCard =>
      const AssetGenImages('assets/images/receipt_card.png');
}

class AssetGenImages {
  final String _assetName;

  const AssetGenImages(this._assetName);

  Image image({double? width, double? height, Color? color}) {
    return Image.asset(_assetName, width: width, height: height, color: color);
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}