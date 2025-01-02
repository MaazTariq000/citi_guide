import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/utils/helpers.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, this.radius = 20, this.url, this.file});

  final double? radius;
  final String? url;
  final File? file;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (file != null)
          CircleAvatar(
            backgroundImage: FileImage(file!),
            radius: radius,
          )
        else if (url != null)
          CircleAvatar(
            backgroundImage: NetworkImage(getBucketUrl(url!)),
            radius: radius,
          )
        else
          CircleAvatar(
            backgroundImage: const NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/7022/7022927.png"),
            radius: radius,
          ),
      ],
    );
  }
}
