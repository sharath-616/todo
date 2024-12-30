import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/Services/to_do_list_provider.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/screens/itemdata_field.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToDoListProvider(),
        )
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: HomePage.classID,
  routes: [
    GoRoute(
      path: HomePage.classID,
      builder: (context, state) => HomePage(),
    ),

    GoRoute(
      path: ItemdataField.classId,
      builder: (context, state) => ItemdataField(),
    )
  ],
);
