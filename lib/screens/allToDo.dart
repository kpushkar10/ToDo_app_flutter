import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/todo.dart';
import '../widgets/todo_Item.dart';

List<ToDo> l1 = [
  ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
  ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
  ToDo(
    id: '03',
    todoText: 'Check Emails',
  ),
  ToDo(
    id: '04',
    todoText: 'Team Meeting',
  ),
  ToDo(
    id: '05',
    todoText: 'Work on mobile apps for 2 hour',
  ),
  ToDo(
    id: '06',
    todoText: 'Dinner with Jenny',
  ),
  ToDo(id: '07', todoText: 'ABC', isDone: true),
  ToDo(id: '08', todoText: '123', isDone: true),
];

class AllToDo extends StatefulWidget {
  const AllToDo({Key? key}) : super(key: key);

  @override
  State<AllToDo> createState() => _AllToDoState();
}

class _AllToDoState extends State<AllToDo> {
  // final todosList = ToDo.todoList();

  TextEditingController _todoInputController = TextEditingController();
  List<ToDo> _foundToDo = [];

  void initState() {
    _foundToDo = l1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                searchBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: const Text(
                      "All ToDo's",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                ClipRRect(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 271,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _foundToDo.length,
                        itemBuilder: (context, index) {
                          return TodoItem(
                            item: _foundToDo[index],
                            onToDoChange: _handleToDoChange,
                            onDeleteItem: _handleDelete,
                          );
                        }),
                  ),
                ),
                //Add new ToDo
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoInputController,
                        decoration: const InputDecoration(
                            hintText: 'Add new todo', border: InputBorder.none),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoInputController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _addToDoItem(String todoText) {
    if (todoText.length == 0) {
      return;
    }
    setState(() {
      l1.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todoText,
          isDone: false));
    });
    _todoInputController.clear();
  }

  void _runFilter(String entererKeyword) {
    List<ToDo> results = [];
    if (entererKeyword.isEmpty) {
      results = l1;
    } else {
      results = l1
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(entererKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      l1[l1.indexWhere((element) => element.id == todo.id)].isDone =
          !todo.isDone;
    });
  }

  void _handleDelete(String delId) {
    setState(() {
      l1.removeAt(l1.indexWhere((element) => element.id == delId));
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: tdBlack,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('Assets/images/avatar.jpeg'),
            ),
          )
        ],
      ),
    );
  }
}
