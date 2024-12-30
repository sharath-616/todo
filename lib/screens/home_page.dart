import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/to_do_list_provider.dart';
import 'package:todo/Utilities/customtext.dart';
import 'package:todo/screens/itemdata_field.dart';

class HomePage extends StatelessWidget {
  static const classID = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListProvider>(
      builder: (context, todoListProvider, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          toolbarHeight: 100,
          backgroundColor: Colors.amber[50],
          title: Customtext(
            text: 'To Do List',
            clr: Colors.black,
            fs: 20,
            fw: FontWeight.bold,
            lp: 1,
          ),
        ),
        body: ListView.builder(
          itemCount: todoListProvider.tasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Customtext(
                          text: todoListProvider.formattedDate,
                          clr: Colors.black,
                          fs: 15,
                          fw: FontWeight.w600,
                        ),
                        Customtext(
                          text: todoListProvider.formattedTime,
                          clr: Colors.black,
                          fs: 15,
                          fw: FontWeight.w600,
                        )
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    ListTile(
                      title: Customtext(text: todoListProvider.tasks[index]),
                      trailing: IconButton(
                          onPressed: () {
                            todoListProvider.removeTask(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          hoverElevation: 2,
          shape: Border.all(
            color: Colors.black12,
            width: 2,
          ),
          focusColor: Colors.grey[50],
          onPressed: () {
            context.go(ItemdataField.classId);
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
