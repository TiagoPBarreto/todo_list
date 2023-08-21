import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

const todoListKey = 'todo_list';
class TodoRepository{
  late SharedPreferences sharedPreferences;

  Future <List<Todo>> getTodoList() async {
   sharedPreferences = await SharedPreferences.getInstance();
   final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
   final List jsonDecoder = json.decode(jsonString) as List;
   return jsonDecoder.map((e) => Todo.fromJson(e)).toList();

  }

  void saveTodoList(List<Todo>todos){
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}