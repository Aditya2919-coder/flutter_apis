import 'package:demo_project/feature/controller/get_api/todos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder(
        init: TodosController(),
        id: TodosController.todosControllerId,
        builder: (a){
          if (a.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if (a.todos.isEmpty){
            return Center(child: Text("No todos found"),);
          }
          return ListView.builder(
            itemCount: a.todos.length,
            itemBuilder: (context, index) {
            final todo = a.todos[index];
            return Container(
              child: Column(
                children: [
                  // Text(todo.id.toString()),
                  // Text(todo.userId.toString()),
                  // Text(todo.todo.toString()),
                  // Text(todo.completed.toString()),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(todo.id.toString().substring(0)),
                        ),
                        title: Text(todo.todo.toString()),
                        subtitle: Text('Completed: ${todo.completed}'),
                      ),
                    ),
                  )
                 
                  
                ],
              ),
            );
          },);
        })
    );
  }
}