import 'package:flutter/material.dart';

class InfoCol extends StatelessWidget {

  final String field;
  final String value;

  const InfoCol({Key? key, required this.field, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        shadowColor: Theme.of(context).primaryColorDark,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(field + ': ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ),
              Flexible(
                  child: Text(value,)),
            ],
          ),
        ),
      ),
    );
  }
}
