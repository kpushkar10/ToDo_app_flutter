import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

import '../models/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo item;
  final onToDoChange;
  final onDeleteItem;
  const TodoItem({
    Key? key,
    required this.item,
    required this.onToDoChange,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void changeIsDone(ToDo todo) => {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 0,
        child: ListTile(
          onTap: () {
            widget.onToDoChange(widget.item);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: widget.item.isDone
              ? IconButton(
                  icon: Icon(Icons.check_box),
                  color: tdBlue,
                  onPressed: () {
                    setState(() {
                      widget.item.isDone = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.check_box_outline_blank),
                  color: tdBlue,
                  onPressed: () {
                    setState(() {
                      widget.item.isDone = true;
                    });
                  },
                ),
          title: Text(
            widget.item.todoText.toString(),
            style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration:
                  widget.item.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.onDeleteItem(widget.item.id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
