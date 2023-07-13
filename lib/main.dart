import 'package:abc/bloc/login_bloc.dart';
import 'package:abc/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // wraped material App with Multiprovider
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc(),),
        Provider<RegisterBloc>(create: (context) => RegisterBloc()),
      ],
      child: MaterialApp(
        title: 'Authentication',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Login(),
      ),
    );
  }
}

