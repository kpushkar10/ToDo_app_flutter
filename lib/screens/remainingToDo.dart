import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PendingToDo extends StatefulWidget {
  const PendingToDo({Key? key}) : super(key: key);

  @override
  State<PendingToDo> createState() => _PendingToDoState();
}

class _PendingToDoState extends State<PendingToDo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("PEnding"),
    );
  }
}
