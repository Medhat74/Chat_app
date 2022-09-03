
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/message_hub.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);


  List<MessageHub>massages=[];
  Stream ? messageStream;

  // masssages
  void sendMassage({required String name,required String type , required String text, required DateTime dateTime}){
    emit(ChatLoadingState());
    MessageHub messageHub = MessageHub(name: name, text: text, time: dateTime,type: type );
    FirebaseFirestore.instance.collection('chat').add(messageHub.toMap()).then((value) {
      if (kDebugMode) {
        print("Success");
      }
      emit(SendMassageSuccessState());
    });
  }

  //
  void getMassages()
  {
    messageStream= FirebaseFirestore.instance.collection('chat').orderBy("time").snapshots();
    if (kDebugMode) {
      print("HIIIIII");
      print (messageStream.toString());
    }
    emit(GetAllMassagesSuccessState());

  }

}
