import 'package:flutter/material.dart';


class ReceivedMassage extends StatelessWidget {
  String? massage;

  ReceivedMassage(this.massage);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),

          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical:5),
        child: Text('${massage!}'),
      ),
    );
  }
}
