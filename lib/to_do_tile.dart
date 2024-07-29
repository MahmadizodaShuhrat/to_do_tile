import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  bool isCompleted;
  String title;
  void Function(bool?)? onChanged;

  ToDoTile({
    required this.title,
    required this.isCompleted,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding:
            const EdgeInsets.only(left: 0, top: 10, right: 0, bottom:10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xffD3D2D2),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
              checkColor: Colors.green,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "$title",
              style: TextStyle(
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
