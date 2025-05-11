import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.label,
    required this.text,
    this.textColor,
    this.maxLines,
  });

  final String label;
  final String text;
  final Color? textColor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.amberAccent),
          ),
          Text(
            text,
            maxLines: maxLines,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: textColor ?? Colors.white),
          ),
        ],
      ),
    );
  }
}

extension TapableTile on CustomTile {
  Widget onTap(BuildContext context, VoidCallback onTap) {
    return InkWell(onTap: onTap, child: this);
  }
}
