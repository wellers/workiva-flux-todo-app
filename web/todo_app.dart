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

library w_flux.example.todo_app;

import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

import 'actions.dart';
import 'stores.dart';
import 'components/todo_app_component.dart';

main() async {
  // initialize action, stores, and components
  ToDoActions actions = new ToDoActions();
  ToDoStore store = new ToDoStore(actions);

  ReactElement toDoApp() => Dom.div()((ToDoApp()
    ..actions = actions
    ..store = store)());

  // render the component
  setClientConfiguration();
  react_dom.render(toDoApp(), querySelector('#content-container'));
}
