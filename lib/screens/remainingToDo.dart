import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/screens/allToDo.dart';
import 'package:todo_app/widgets/updated_todo_item.dart';

import '../models/todo.dart';
import '../widgets/pending_todo_tile.dart';
import '../widgets/todo_Item.dart';

class PendingToDo extends StatefulWidget {
  const PendingToDo({Key? key}) : super(key: key);

  @override
  State<PendingToDo> createState() => _PendingToDoState();
}

class _PendingToDoState extends State<PendingToDo> {
  final todosList = ToDo.todoList();
  List<ToDo> pending = [];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      pending = todosList.where((item) => item.isDone == false).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          const Text(
            "Pending ToDo's",
            style: TextStyle(fontSize: 30),
          ),
          ClipRRect(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: pending.length,
                  itemBuilder: (context, index) {
                    return PendigToDoTile(
                      item: pending[index],
                      onToDoChange: _handleToDoChange,
                      onDeleteItem: _handleDelete,
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDelete(String delId) {
    setState(() {
      pending.removeWhere((item) => item.id == delId);
    });
  }
}
