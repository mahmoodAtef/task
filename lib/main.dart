import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:task/core/remote/dio_helper.dart';
import 'package:task/core/utils/theme_manager.dart';
import 'package:task/task/presentation_layer/bloc/task_bloc.dart';
import 'package:task/task/presentation_layer/screens/home_screen.dart';
import 'core/services/dep_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, DeviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<TaskBloc>(
            create: (context) => sl()..add(GetUsersEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: getAppTheme(),
          home: const HomeScreen(),
        ),
      );
    });
  }
}
