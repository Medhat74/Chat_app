/*
import 'package:flutter/material.dart';

class EndRoom extends StatelessWidget {
  const EndRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'write your Massage here ..',
            border: InputBorder.none,
          ),
        ),
      ),
      Container(
        color: Colors.blueGrey,
        height: 50,
        child: IconButton(onPressed: (){
          ChatCubit.get(context).sendMassage(widget.userModel!.ID!,
              textController.value.text, DateTime.now().toString());
          textController.text='';
        }, icon: Icon(Icons.send,color: Colors.white,size:25,)),
      ),
    ],),;
  }
}
*/
