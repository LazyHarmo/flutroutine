import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutroutine/home.dart';
import 'package:flutroutine/simple_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc/task_bloc.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	HydratedBloc.storage = await HydratedStorage.build(
		storageDirectory: await getTemporaryDirectory(),
	);
	Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Task App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
					surface: Colors.white,
					onSurface: Colors.black,
					primary: Color.fromARGB(255, 98, 250, 255),
					onPrimary: Colors.black,
					secondary: Color.fromARGB(255, 97, 61, 255),
					onSecondary: Colors.white
				),
      ),
      home: BlocProvider<TaskBloc>(
				create: (context) => TaskBloc()..add(
					TaskStarted()
				),
				child: const HomeScreen(),
			),
    );
  }
}
