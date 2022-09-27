import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/allToDo.dart';
import 'package:todo_app/widgets/updated_todo_item.dart';

import '../widgets/todo_Item.dart';

class CompletedToDo extends StatefulWidget {
  const CompletedToDo({Key? key}) : super(key: key);

  @override
  State<CompletedToDo> createState() => _CompletedToDoState();
}

class _CompletedToDoState extends State<CompletedToDo> {
  // final todosList = ToDo.todoList();

  List<ToDo> completed = [];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      completed = l1.where((item) => item.isDone == true).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Text(
            "Completed ToDo's",
            style: TextStyle(fontSize: 30),
          ),
          ClipRRect(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {
                    return DoneToDoTile(
                      item: completed[index],
                      onDeleteItem: _handleDelete,
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }

  void _handleDelete(String delId) {
    setState(() {
      completed
          .removeAt(completed.indexWhere((element) => element.id == delId));
      l1.removeAt(l1.indexWhere((element) => element.id == delId));
    });
  }
}
