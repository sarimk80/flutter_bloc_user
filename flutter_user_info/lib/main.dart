import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_info/src/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Bloc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserinfoBloc _bloc = UserinfoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, UserinfoState state) {
          if (state is InitialUserinfoState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    state.userInfo.name,
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 40),
                  ),
                  Text(
                    state.userInfo.age.toString(),
                  ),
                  Text(
                    state.userInfo.email,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            );
          }
          if (state is UpdatedUserinfoState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    state.userInfo.name,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    state.userInfo.age.toString(),
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  Text(state.userInfo.email)
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.change_history),
        onPressed: () => _bloc.dispatch(Fetch()),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
