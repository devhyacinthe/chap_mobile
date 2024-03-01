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

  //static const profileImageJpeg = "$_base/profile.jpeg";
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
}

class PlaceholderAssets {
  const PlaceholderAssets._();

  //static const _base = BasePaths.basePlaceholderPath;

  //static const carouselCardJpeg = "$_base/carousel_placehoder.jpeg";
}
