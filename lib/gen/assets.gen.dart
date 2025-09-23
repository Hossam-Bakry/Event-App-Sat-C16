// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/birthday_icn.png
  AssetGenImage get birthdayIcn =>
      const AssetGenImage('assets/icons/birthday_icn.png');

  /// File path: assets/icons/book_club_icn.png
  AssetGenImage get bookClubIcn =>
      const AssetGenImage('assets/icons/book_club_icn.png');

  /// File path: assets/icons/email_icn.png
  AssetGenImage get emailIcn =>
      const AssetGenImage('assets/icons/email_icn.png');

  /// File path: assets/icons/favorite_icn.png
  AssetGenImage get favoriteIcn =>
      const AssetGenImage('assets/icons/favorite_icn.png');

  /// File path: assets/icons/google_icn.png
  AssetGenImage get googleIcn =>
      const AssetGenImage('assets/icons/google_icn.png');

  /// File path: assets/icons/home_icn.png
  AssetGenImage get homeIcn => const AssetGenImage('assets/icons/home_icn.png');

  /// File path: assets/icons/map_icn.png
  AssetGenImage get mapIcn => const AssetGenImage('assets/icons/map_icn.png');

  /// File path: assets/icons/password_icn.png
  AssetGenImage get passwordIcn =>
      const AssetGenImage('assets/icons/password_icn.png');

  /// File path: assets/icons/person_icn.png
  AssetGenImage get personIcn =>
      const AssetGenImage('assets/icons/person_icn.png');

  /// File path: assets/icons/selected_favorite_icn.png
  AssetGenImage get selectedFavoriteIcn =>
      const AssetGenImage('assets/icons/selected_favorite_icn.png');

  /// File path: assets/icons/selected_home_icn.png
  AssetGenImage get selectedHomeIcn =>
      const AssetGenImage('assets/icons/selected_home_icn.png');

  /// File path: assets/icons/selected_map_icn.png
  AssetGenImage get selectedMapIcn =>
      const AssetGenImage('assets/icons/selected_map_icn.png');

  /// File path: assets/icons/selected_user_icn.png
  AssetGenImage get selectedUserIcn =>
      const AssetGenImage('assets/icons/selected_user_icn.png');

  /// File path: assets/icons/sport_icn.png
  AssetGenImage get sportIcn =>
      const AssetGenImage('assets/icons/sport_icn.png');

  /// File path: assets/icons/user_icn.png
  AssetGenImage get userIcn => const AssetGenImage('assets/icons/user_icn.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    birthdayIcn,
    bookClubIcn,
    emailIcn,
    favoriteIcn,
    googleIcn,
    homeIcn,
    mapIcn,
    passwordIcn,
    personIcn,
    selectedFavoriteIcn,
    selectedHomeIcn,
    selectedMapIcn,
    selectedUserIcn,
    sportIcn,
    userIcn,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/birthday_img.png
  AssetGenImage get birthdayImg =>
      const AssetGenImage('assets/images/birthday_img.png');

  /// File path: assets/images/bookClub_img.png
  AssetGenImage get bookClubImg =>
      const AssetGenImage('assets/images/bookClub_img.png');

  /// File path: assets/images/change_password_img.png
  AssetGenImage get changePasswordImg =>
      const AssetGenImage('assets/images/change_password_img.png');

  /// File path: assets/images/eating_img.png
  AssetGenImage get eatingImg =>
      const AssetGenImage('assets/images/eating_img.png');

  /// File path: assets/images/exhibition_img.png
  AssetGenImage get exhibitionImg =>
      const AssetGenImage('assets/images/exhibition_img.png');

  /// File path: assets/images/gaming_img.png
  AssetGenImage get gamingImg =>
      const AssetGenImage('assets/images/gaming_img.png');

  /// File path: assets/images/holiday_img.png
  AssetGenImage get holidayImg =>
      const AssetGenImage('assets/images/holiday_img.png');

  /// File path: assets/images/meeting_img.png
  AssetGenImage get meetingImg =>
      const AssetGenImage('assets/images/meeting_img.png');

  /// File path: assets/images/route_logo.png
  AssetGenImage get routeLogo =>
      const AssetGenImage('assets/images/route_logo.png');

  /// File path: assets/images/sport_img.png
  AssetGenImage get sportImg =>
      const AssetGenImage('assets/images/sport_img.png');

  /// File path: assets/images/workshop_img.png
  AssetGenImage get workshopImg =>
      const AssetGenImage('assets/images/workshop_img.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    birthdayImg,
    bookClubImg,
    changePasswordImg,
    eatingImg,
    exhibitionImg,
    gamingImg,
    holidayImg,
    meetingImg,
    routeLogo,
    sportImg,
    workshopImg,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
