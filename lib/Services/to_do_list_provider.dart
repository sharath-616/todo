import 'package:flutter/material.dart';
import 'dart:async';

class ToDoListProvider extends ChangeNotifier {
  final TextEditingController _listNameController = TextEditingController();
  final TextEditingController _listDescriptionController = TextEditingController();
  String _formattedDate = "";
  String _formattedTime = "";
  final bool _isLoading = false;
  final List<String> _tasks = [];

  String get formattedDate => _formattedDate;
  String get formattedTime => _formattedTime;
  TextEditingController get listNameController => _listNameController;
  TextEditingController get listDescriptionController => _listDescriptionController;
  bool get isLoading => _isLoading;
  List<String> get tasks => _tasks;

  ToDoListProvider() {
    _updateDateTime();
    Timer.periodic(Duration(seconds: 1), (timer) => _updateDateTime());
  }

  void _updateDateTime() {
    final now = DateTime.now().toUtc();
    _formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    _formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    notifyListeners();
  }

  @override
  void dispose() {
    _listNameController.dispose();
    super.dispose();
  }

  void addTask(
    String tasks,
  ) {
    _tasks.add(tasks);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void clearInputField() {
    listNameController.clear();
    listDescriptionController.clear();
  }
}
