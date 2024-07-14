import 'package:flutroutine/bloc/task/task_bloc.dart';
import 'package:flutroutine/components/bottomsheet.dart';
import 'package:flutroutine/components/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO",
          style: TextStyle(fontSize: 30,color: Colors.white),
        ),
        centerTitle: true,
        elevation: 40,
        backgroundColor: Color.fromARGB(255, 114, 20, 255),
      ),
      body:BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {

          if(state.tasks.isEmpty){
            return Center(
              child: Lottie.asset('assets/Animation - 1712305102953.json'),
          );
        }
          else{
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) 
                {
                  return SizedBox(
                    width: 180,
                    child:Column(
                      
                     children:[
                      Container(
                        width: 380,
                
                      child: ListTile(
                        title: Text("${state.tasks[index].taskname.toString()}",style: TextStyle(fontSize: 30),),
                        onTap: () {
                          Bottomsheet(context,index);
                        },
                        trailing: IconButton(
                          icon:Icon(Icons.delete),
                          onPressed: (){
                            context.read<TaskBloc>().add(DelEvent(index: index));
                          },
                          ),
                      ),
                    ),
                    SizedBox(height: 20,),
                ]));
                }),
          );}
        },
  ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogBox(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}