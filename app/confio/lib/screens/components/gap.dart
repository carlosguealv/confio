import 'package:flutter/widgets.dart';
import '../../utils/size_config.dart';

class Gap extends StatelessWidget {
  final double? height;
  final double? width;

  const Gap({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sy! * (width ?? 0),
      height: sx! * (height ?? 0),
    );
  }
}
