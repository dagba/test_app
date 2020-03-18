import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/presentation/bloc/task_list/task_list_bloc.dart';
import 'package:testapp/presentation/ui/screens/task_list_screen.dart';

import 'domain/repository/task_list_repository.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      checkerboardOffscreenLayers: false,
      title: 'TODO app',
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0.0)),
      home: Provider<TaskListBloc>(
          create: (context) =>
              TaskListBloc(repository: TaskListRepositoryImpl()),
          dispose: (context, value) => value.dispose(),
          child: TaskListScreen()),
    );
  }
}
