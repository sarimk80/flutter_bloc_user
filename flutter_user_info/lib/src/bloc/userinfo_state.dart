import 'package:flutter_user_info/src/user_info.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserinfoState {}
  
class InitialUserinfoState extends UserinfoState {
  final UserInfo userInfo;

  InitialUserinfoState(this.userInfo);

}

class UpdatedUserinfoState extends UserinfoState{
  final UserInfo userInfo;

  UpdatedUserinfoState(this.userInfo);

}
