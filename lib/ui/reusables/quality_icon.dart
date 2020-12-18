import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';

class QualityIcon extends StatelessWidget{

  final IconData icon;
  final Color iconColor;
  final bool added;

  const QualityIcon({Key key, this.icon, this.iconColor, this.added = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: themeService.darkColor
        )
      ),
      child: Icon(icon,color: iconIncludedColor(added),),
    );
  }

  Color iconIncludedColor(bool added){
   return added?iconColor:Colors.black45;
  }

}