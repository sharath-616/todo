import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/to_do_list_provider.dart';
import 'package:todo/Utilities/customtext.dart';
import 'package:todo/Utilities/custon_textform_field.dart';
import 'package:todo/screens/home_page.dart';

class ItemdataField extends StatelessWidget {
  static const classId = '/itemdata_field';
  const ItemdataField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        toolbarHeight: 100,
        backgroundColor: Colors.amber[50],
        title: Customtext(
          text: 'Add your list',
          clr: Colors.black,
          fs: 20,
          fw: FontWeight.bold,
          lp: 1,
        ),
        leading: IconButton(
            onPressed: () {
              context.go(HomePage.classID);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Consumer<ToDoListProvider>(
          builder: (context, todoListProvider, child) => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Customtext(
                  text: 'To days Note : ',
                  clr: Colors.black,
                  fs: 20,
                  fw: FontWeight.bold,
                ),
                SizedBox(
                  height: 50,
                ),
                CustonTextformField(
                  controller: todoListProvider.listNameController,
                  hintText: 'Today Note Title',
                  labelText: 'Today Note',
                ),
                SizedBox(
                  height: 50,
                ),
                CustonTextformField(
                  controller: todoListProvider.listDescriptionController,
                  hintText: 'special today',
                  labelText: 'What special today',
                  maxLines: 3,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(5), boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.35),
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: Offset(
                          0,
                          5,
                        ),
                      ),
                    ]),
                    child: TextButton.icon(
                      onPressed: () {
                        final title = todoListProvider.listNameController.text.trim();
                        if (title.isNotEmpty) {
                          todoListProvider.addTask(title); 
                          todoListProvider.clearInputField(); 
                          context.go(HomePage.classID);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter a task title!")),
                          );
                        }
                      },
                      label: Customtext(
                        text: 'Add Note',
                        clr: Colors.black,
                        fs: 15,
                        fw: FontWeight.bold,
                      ),
                      icon: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
