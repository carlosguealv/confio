import 'package:flutter/widgets.dart';
import '../../utils/size_config.dart';

class Gap extends StatelessWidget {
  final double? height;
  final double? width;

  const Gap({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sy! * (width ?? 0),
      height: sx! * (height ?? 0),
    );
  }
}
