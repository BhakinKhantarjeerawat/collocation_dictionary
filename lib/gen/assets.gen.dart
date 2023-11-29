/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bean_stalk.png
  AssetGenImage get beanStalk =>
      const AssetGenImage('assets/images/bean_stalk.png');

  /// File path: assets/images/bo.png
  AssetGenImage get bo => const AssetGenImage('assets/images/bo.png');

  /// File path: assets/images/bt.png
  AssetGenImage get bt => const AssetGenImage('assets/images/bt.png');

  /// File path: assets/images/cat.png
  AssetGenImage get cat => const AssetGenImage('assets/images/cat.png');

  /// File path: assets/images/cat_black_and_white.png
  AssetGenImage get catBlackAndWhite =>
      const AssetGenImage('assets/images/cat_black_and_white.png');

  /// File path: assets/images/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/clock.png');

  /// File path: assets/images/document-.png
  AssetGenImage get document =>
      const AssetGenImage('assets/images/document-.png');

  /// File path: assets/images/dragon.png
  AssetGenImage get dragon => const AssetGenImage('assets/images/dragon.png');

  /// File path: assets/images/forest.png
  AssetGenImage get forest => const AssetGenImage('assets/images/forest.png');

  /// File path: assets/images/go.png
  AssetGenImage get go => const AssetGenImage('assets/images/go.png');

  /// File path: assets/images/gt.png
  AssetGenImage get gt => const AssetGenImage('assets/images/gt.png');

  /// File path: assets/images/happiness.png
  AssetGenImage get happiness =>
      const AssetGenImage('assets/images/happiness.png');

  /// File path: assets/images/hen.png
  AssetGenImage get hen => const AssetGenImage('assets/images/hen.png');

  /// File path: assets/images/night.png
  AssetGenImage get night => const AssetGenImage('assets/images/night.png');

  /// File path: assets/images/oven.png
  AssetGenImage get oven => const AssetGenImage('assets/images/oven.png');

  /// File path: assets/images/ramen.png
  AssetGenImage get ramen => const AssetGenImage('assets/images/ramen.png');

  /// File path: assets/images/ro.png
  AssetGenImage get ro => const AssetGenImage('assets/images/ro.png');

  /// File path: assets/images/road.png
  AssetGenImage get road => const AssetGenImage('assets/images/road.png');

  /// File path: assets/images/rt.png
  AssetGenImage get rt => const AssetGenImage('assets/images/rt.png');

  /// File path: assets/images/soy.png
  AssetGenImage get soy => const AssetGenImage('assets/images/soy.png');

  /// File path: assets/images/stream.png
  AssetGenImage get stream => const AssetGenImage('assets/images/stream.png');

  /// File path: assets/images/treasure.png
  AssetGenImage get treasure =>
      const AssetGenImage('assets/images/treasure.png');

  /// File path: assets/images/water_fall.png
  AssetGenImage get waterFall =>
      const AssetGenImage('assets/images/water_fall.png');

  /// File path: assets/images/wind.png
  AssetGenImage get wind => const AssetGenImage('assets/images/wind.png');

  /// File path: assets/images/wood.png
  AssetGenImage get wood => const AssetGenImage('assets/images/wood.png');

  /// File path: assets/images/yo.png
  AssetGenImage get yo => const AssetGenImage('assets/images/yo.png');

  /// File path: assets/images/yt.png
  AssetGenImage get yt => const AssetGenImage('assets/images/yt.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        beanStalk,
        bo,
        bt,
        cat,
        catBlackAndWhite,
        clock,
        document,
        dragon,
        forest,
        go,
        gt,
        happiness,
        hen,
        night,
        oven,
        ramen,
        ro,
        road,
        rt,
        soy,
        stream,
        treasure,
        waterFall,
        wind,
        wood,
        yo,
        yt
      ];
}

class $AssetsVoicesGen {
  const $AssetsVoicesGen();

  /// File path: assets/voices/her.mp3
  String get her => 'assets/voices/her.mp3';

  /// File path: assets/voices/his.mp3
  String get his => 'assets/voices/his.mp3';

  /// File path: assets/voices/his_pencil.mp3
  String get hisPencil => 'assets/voices/his_pencil.mp3';

  /// File path: assets/voices/pen.mp3
  String get pen => 'assets/voices/pen.mp3';

  /// File path: assets/voices/pencil.mp3
  String get pencil => 'assets/voices/pencil.mp3';

  /// List of all assets
  List<String> get values => [her, his, hisPencil, pen, pencil];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVoicesGen voices = $AssetsVoicesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
