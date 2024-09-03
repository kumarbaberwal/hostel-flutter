import 'package:flutter/widgets.dart';
import 'package:hostel/core/configs/assets/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

class HostelLogo extends StatelessWidget {
  const HostelLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.sizeOf(context).width,
      child: SvgPicture.asset(AppVectors.hostelLogo),
    );
  }
}
