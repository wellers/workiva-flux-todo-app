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

library w_flux.example.todo_app.components.todo_list_item;

import 'package:over_react/over_react.dart';

import '../stores.dart';
import '../actions.dart';

@Factory()
UiFactory<TodoListItemProps> TodoListItem;

@Props()
class TodoListItemProps extends FluxUiProps<ToDoActions, ToDoStore> {
  Todo todo;
  Function onClick;
}

@Component()
class TodoListItemComponent extends FluxUiComponent<TodoListItemProps> {
  getDefaultProps() => (newProps()..todo = null);

  render() {
    String className =
        props.todo.completed ? 'list-group-item completed' : 'list-group-item';
    return (Dom.span()..className = className)(Dom.label()(
        (Dom.input()
          ..type = 'checkbox'
          ..label = props.todo.description
          ..checked = props.todo.completed
          ..onChange = _onClick)(),
        props.todo.description));
  }

  _onClick(event) {
    props.onClick(props.todo);
  }
}