import 'package:chap_mobile/src/config/base.dart';

/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets {
  const ImageAssets._();

  static const _base = BasePaths.baseImagePath;

  static const welcomeImagePath = "$_base/welcome.png";

  static const avatar = "$_base/avatar.png";
  static const user = "$_base/user.png";
  static const account = "$_base/account.png";
}

class AnimationAssets {
  const AnimationAssets._();

  /// Contains all the paths of animations used across the project.
  //static const _base = BasePaths.baseImagePath;

  //static const sampleAnimationPath = "$_base/animation.png";
}

class IconAssets {
  const IconAssets._();

  /// Contains all the paths of icons used across the project.
  static const _base = BasePaths.baseIconPath;

  static const String arrow_left = "$_base/arrow-left.svg";
  static const String password = "$_base/key-square.svg";
  static const String phoneNumber = "$_base/smartphone.svg";
  static const String arrow_right = "$_base/arrow-right.svg";
  static const String user = "$_base/user.svg";
  static const String edit = "$_base/edit.svg";
  static const String share = "$_base/share-2.svg";
  static const String contact = "$_base/message-circle-more.svg";
  static const String barChart = "$_base/bar-chart-2.svg";
  static const String info = "$_base/info.svg";
  static const String client = "$_base/contact-2.svg";
  static const String notification = "$_base/bell.svg";
  static const String barChart2 = "$_base/bar-chart-3.svg";
  static const String settings = "$_base/settings.svg";
}

class PlaceholderAssets {
  const PlaceholderAssets._();

  //static const _base = BasePaths.basePlaceholderPath;

  //static const carouselCardJpeg = "$_base/carousel_placehoder.jpeg";
}
