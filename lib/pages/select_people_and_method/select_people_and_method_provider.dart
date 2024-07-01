import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_training_center/pages/select_people_and_method/select_people_and_method_state.dart';

class SelectPeopleAndMethodProvider extends ChangeNotifier {
  final state = SelectPeopleAndMethodState();

  void init() {
    state.count = 0;
    state.selected = false;
    notifyListeners();
  }

  void add() {
    state.count++;
    notifyListeners();
  }

  void minus() {
    if(state.count > 0) state.count--;
    notifyListeners();
  }

  void changeSelect(BuildContext context) {
    state.selected = !state.selected;
    notifyListeners();

    if(state.selected && state.count > 0) {
      GoRouter.of(context).pushNamed("menu", extra: state.count);
    }
  }
}