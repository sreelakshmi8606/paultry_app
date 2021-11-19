// ignore_for_file: unnecessary_import, library_prefixes

import 'dart:io';
import 'package:e_comm/BranchBloc/branchlist_cubit.dart';
import 'package:e_comm/FarmModel.dart';
import 'package:e_comm/SelectBranch.dart';
import 'package:e_comm/form_menu.dart';
import 'package:e_comm/forms/master_forms/Farm_Master_List.dart';
import 'package:e_comm/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:e_comm/forms/master_forms/farm.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();
  //Hive.registerAdapter(FarmDataModelAdapter());

 await Hive.openBox('Farm');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: BlocProvider(
        //   create: (context) => BranchlistCubit(url: '')..fetchData(),
        //   child: Login(),
        // )
        //
      home:Login(),
    );
  }
}
