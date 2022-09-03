import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat_cubit/chat_cubit.dart';
import '../views/chat_view/chat_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) => ChatCubit()..getMassages()),
      ],
      child: MaterialApp(
        home: ChatView(),
      ),
    );
  }
}
