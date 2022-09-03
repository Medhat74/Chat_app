part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatLoadingState extends ChatState {}

////send massages
class SendMassageSuccessState extends ChatState {}
class SendMassageErrorState extends ChatState {}
////get All Massages massages
class GetAllMassagesSuccessState extends ChatState {}
class GetAllMassagesErrorState extends ChatState {}
