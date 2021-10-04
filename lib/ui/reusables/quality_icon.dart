import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';

class QualityIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final bool added;

  const QualityIcon({
    Key? key,
    required this.icon,
    this.iconColor = Colors.white,
    this.added = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: () {
          // Add the thing
        },
        backgroundColor: Colors.blueGrey.shade700,
        child: Icon(
          icon,
          color: iconIncludedColor(added),
        ),
      ),
    );
  }

  Color iconIncludedColor(bool added) {
    return added ? iconColor : Colors.white;
  }
}
