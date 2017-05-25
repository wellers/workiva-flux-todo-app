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

library w_flux.example.todo_app.components.new_todo_input;

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';

import '../store.dart';
import '../actions.dart';

@Factory()
UiFactory<NewTodoInputProps> NewTodoInput;

@Props()
class NewTodoInputProps extends FluxUiProps<ToDoActions, ToDoStore> {
  String value;
  Function onSubmit;
}

@State()
class NewTodoInputState extends UiState {
  String value;
}

@Component()
class NewTodoInputComponent
    extends FluxUiStatefulComponent<NewTodoInputProps, NewTodoInputState> {
  getDefaultProps() => (newProps()..value = '');

  @override
  Map getInitialState() => (newState()..value = '');

  render() {
    return (Dom.form()..onSubmit = _onSubmit)((Dom.input()
      ..className = 'form-control'
      ..placeholder = 'Add a new todo...'
      ..type = 'text'
      ..value = state.value
      ..onChange = _onChange)());
  }

  _onChange(react.SyntheticFormEvent event) {
    setState(newState()..value = event.target.value);
  }

  _onSubmit(event) {
    event.preventDefault();
    props.onSubmit(state.value);
    this.setState(newState()..value = '');
  }
}