import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:odcproject/views/chat_view/componants/recieved_message.dart';
import 'package:odcproject/views/chat_view/componants/send_message.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key, required this.messageStream}) : super(key: key);
  final Stream messageStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: messageStream,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            QuerySnapshot querySnapshot= snapshot.data as QuerySnapshot;
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: querySnapshot.docs.length ,
                itemBuilder: (context,index){
                  if("Medhat"== querySnapshot.docs[index]['name'])
                  {
                    return SendMessage(querySnapshot.docs[index]['text']);
                  }
                  return ReceivedMassage(querySnapshot.docs[index]['text']);
                },
                separatorBuilder:(context,index)=>SizedBox(height: 10,)
            );
          }
          else {
            return Center(child: Text('Empty'),);
          }
        });
  }
}
