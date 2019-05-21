import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_user_info/src/user_info.dart';
import './bloc.dart';

class UserinfoBloc extends Bloc<UserinfoEvent, UserinfoState> {
  @override
  UserinfoState get initialState => InitialUserinfoState(
      UserInfo(name: "bob", age: 14, email: "sarim80@gmail.com"));

  @override
  Stream<UserinfoState> mapEventToState(UserinfoEvent event) async* {
    if (event is Fetch) {
      try {
        yield UpdatedUserinfoState(UserInfo(
            name: "Sam", age: 25, email: "sam0321@gmail.com"));
      } catch (_) {}
    }
  }
}
