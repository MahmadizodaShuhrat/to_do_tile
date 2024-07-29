import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  List<List<dynamic>> toDoList = [
    ["Learn Flutter", false],
    ["Do Exercise", false],
    ["Sleep well", false],
  ];

  void onChecked(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _showAddToDoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 140.h,
            child: Column(
              children: [
                TextField(
                  controller: _textEditingController,
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toDoList.add([_textEditingController.text, false]);
                          _textEditingController.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text("сохранить "),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("отмена"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: [
                  Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/person.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anil',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25.sp),
                      ),
                      Text(
                        'Online - Last seen, 2.02pm',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13.sp,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.phone_outlined),
                        color: Color(0xff25D366),
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.video_call_outlined),
                        color: Color(0xff25D366),
                        iconSize: 34,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'images/icons.jpeg',
                            height: 40,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                toDoList.removeAt(index);
                              });
                            },
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ToDoTile(
                        title: toDoList[index][0],
                        isCompleted: toDoList[index][1],
                        onChanged: (value) => onChecked(index),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showAddToDoDialog(context);
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 20.h), // Add spacing below the FAB
            ],
          ),
        );
      },
    );
  }
}
