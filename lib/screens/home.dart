import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/allToDo.dart';
import 'package:todo_app/screens/completedToDo.dart';
import 'package:todo_app/screens/remainingToDo.dart';

import '../widgets/todo_Item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  int? _pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Container(
          width: 300,
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 18.0),
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                      tileColor: _pageIndex == 0
                          ? Colors.grey.shade300
                          : Colors.transparent,
                      title: Text('All',
                          style: TextStyle(
                              color: _pageIndex == 0
                                  ? Colors.blue
                                  : Colors.black)),
                      onTap: () {
                        setState(() {
                          _pageIndex = 0;
                        });
                        _pageController.jumpToPage(0);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                      tileColor: _pageIndex == 1
                          ? Colors.grey.shade300
                          : Colors.transparent,
                      title: Text('Completed',
                          style: TextStyle(
                              color: _pageIndex == 1
                                  ? Colors.blue
                                  : Colors.black)),
                      onTap: () {
                        setState(() {
                          _pageIndex = 1;
                        });
                        _pageController.jumpToPage(1);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                      tileColor: _pageIndex == 2
                          ? Colors.grey.shade300
                          : Colors.transparent,
                      title: Text('Pending',
                          style: TextStyle(
                              color: _pageIndex == 2
                                  ? Colors.blue
                                  : Colors.black)),
                      onTap: () {
                        setState(() {
                          _pageIndex = 2;
                        });
                        _pageController.jumpToPage(2);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        body: PageView(
          controller: _pageController,
          children: [
            AllToDo(),
            CompletedToDo(),
            PendingToDo(),
          ],
        ));
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
// Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 50),
//             child: Column(
//               children: [
//                 searchBox(),
//                 Expanded(
//                   child: Container(
//                     height: 400,
//                     child: ListView(
//                       children: [
//                         // Container(
//                         //   margin: EdgeInsets.only(top: 50, bottom: 20),
//                         //   child: Text(
//                         //     'All ToDos',
//                         //     style: TextStyle(
//                         //       fontSize: 30,
//                         //       fontWeight: FontWeight.w500,
//                         //     ),
//                         //   ),
//                         // ),
//                         //todos list
//                         for (ToDo item in todosList)
//                           TodoItem(
//                             item: item,
//                             onToDoChange: _handleToDoChange,
//                             onDeleteItem: _handleDelete,
//                           )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //Bottom Add Item bar
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.grey,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 bottom: 20, left: 20, right: 20),
//                             // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(0.0, 0.0),
//                                   blurRadius: 10.0,
//                                   spreadRadius: 0.0,
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "Add new item",
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 20, right: 20),
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: Text(
//                               '+',
//                               style: TextStyle(fontSize: 40),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: tdBlue,
//                               minimumSize: Size(60, 60),
//                               elevation: 10,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),