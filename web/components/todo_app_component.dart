// Copyright 2015 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library w_flux.example.todo_app.components.todo_app_component;

import 'package:over_react/over_react.dart';

import 'new_todo_input.dart';
import 'todo_list_item.dart';

import '../stores.dart';
import '../actions.dart';

@Factory()
UiFactory<ToDoAppProps> ToDoApp;

@Props()
class ToDoAppProps extends FluxUiProps<ToDoActions, ToDoStore> {}

@State()
class ToDoState extends UiState {}

@Component()
class ToDoAppComponent
    extends FluxUiStatefulComponent<ToDoAppProps, ToDoState> {
  getDefaultProps() => (newProps());

  @override
  render() {
    List todoListItems = [];
    int keyProp = 0;
    props.store.todos.forEach((Todo todo) {
      todoListItems.add((TodoListItem()
        ..key = keyProp
        ..todo = todo
        ..onClick = _completeTodo)());
      keyProp++;
    });

    var todoList = (Dom.div()..className = 'list-group')(todoListItems);

    var pageHeader =
        (Dom.div()..className = 'page-header')(Dom.h1()('My Todos'));
    var clearButton = (Dom.button()
      ..onClick = _clearList
      ..disabled = props.store.todos.length == 0)('Clear Todo List');

    return Dom.div()(pageHeader, Dom.p()('A sample Todo application'),
        (NewTodoInput()..onSubmit = _createTodo)(), todoList, clearButton);
  }

  _clearList(_) {
    props.actions.clearTodoList();
  }

  _createTodo(String value) {
    props.actions.createTodo(new Todo(value));
  }

  _completeTodo(todo) {
    props.actions.completeTodo(todo);
  }
}