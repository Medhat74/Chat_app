import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcproject/views/chat_view/componants/chat_room.dart';

import '../../chat_cubit/chat_cubit.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: ChatRoom(messageStream: cubit.messageStream!)),

              Row(children: [
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
                  child: IconButton(onPressed: () {
                    cubit.getMassages();
                    cubit.sendMassage(name: 'Medhat', type: 'Sender', dateTime: DateTime.now(),text: textController.text);
                    //   textController.text, DateTime.now().toString());
                    textController.text = '';
                  }, icon: Icon(Icons.send, color: Colors.white, size: 25,)),
                ),
              ],),
            ],
          );
        },
      ),
    );
  }
}
