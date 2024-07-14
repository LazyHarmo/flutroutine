import 'package:flutroutine/bloc/task/task_bloc.dart';
import 'package:flutroutine/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lasttime App',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              surface: Colors.white,
              onSurface: Colors.black,
              primary: Color.fromARGB(255, 98, 250, 255),
              onPrimary: Colors.black,
              secondary: Color.fromARGB(255, 97, 61, 255),
              onSecondary: Colors.white),
        ),
        home: Home(),
        ),
      );
  }
}
