import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  final String url;
  const LogoContainer({Key? key, required this.url})
      : assert(url != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 130.0,
      child: Container(
        child: Image.asset(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
