import 'package:flutter/widgets.dart';

double? sx;
double? sy;
double? sText;
double? fullWidth;
double? fullHeight;

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _blockSizeHorizontal = 0;
  static double? _blockSizeVertical = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if ((_screenWidth ?? 0) < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = _screenWidth ?? 0 / 100;
    _blockSizeVertical = _screenHeight ?? 0 / 100;

    fullHeight = _screenHeight;
    fullWidth = _screenWidth;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;

    sx = heightMultiplier;
    sy = widthMultiplier;
    sText = imageSizeMultiplier;
  }
}
