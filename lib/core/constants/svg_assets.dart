import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssets {
  static Widget splashScreen =
      SvgPicture.asset('assets/static_assets/logo_gokatz.svg', fit: BoxFit.cover,color: Colors.black,);
  static Widget logo = SvgPicture.asset(
    '$staticAsset/logo.svg',
    fit: BoxFit.contain,
  );
}
