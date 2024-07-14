import 'package:flutroutine/bloc/task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> Bottomsheet(BuildContext context,int index) async {
  return showModalBottomSheet(
    context: context,
    elevation: 40,
    builder: (BuildContext context) {
      return ClipRRect(
        // Wrap the content with ClipRRect
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            
            return Container(
              color: const Color.fromARGB(255, 143, 177, 252),
              height: 250,
              width: 420,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Text("${state.tasks[index].taskname.toString()}",style: TextStyle(color: Colors.white,fontSize: 70),),
                  const SizedBox(height: 15),
                  Text("${state.tasks[index].taskdesc.toString()}",style: TextStyle(color: Colors.white,fontSize: 30)),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}