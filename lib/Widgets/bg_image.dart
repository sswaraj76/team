import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  final String imageUrl;
  const BgImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rectangle) {
        return const LinearGradient(
          colors: [Colors.white, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
      },
      child: Image(
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl),
      ),
    );
  }
}
