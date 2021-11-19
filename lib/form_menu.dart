// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:e_comm/ChickBloc/cubit/chicktransfer_cubit.dart';
import 'package:e_comm/PickUpBloc/cubit/pickuplist_cubit.dart';
import 'package:e_comm/ReportBloc/reportbloc_cubit.dart';
import 'package:e_comm/forms/master_forms/Farm_Master_List.dart';

import 'package:e_comm/forms/transaction_forms/ChickTransferList.dart';
import 'package:e_comm/forms/transaction_forms/DailyEntry_List.dart';
import 'package:e_comm/forms/transaction_forms/Delivery_List.dart';
import 'package:e_comm/forms/transaction_forms/Hatchery_Transaction_List.dart';
import 'package:e_comm/forms/transaction_forms/PickUp_Transaction_List.dart';
import 'package:e_comm/forms/transaction_forms/Pickup_Transaction_Editor.dart';
import 'package:e_comm/forms/transaction_forms/Report.dart';
import 'package:e_comm/forms/transaction_forms/ReportByBatch.dart';
import 'package:e_comm/forms/transaction_forms/chick_transferEditor.dart';
import 'package:e_comm/forms/transaction_forms/DailyEntry_Editor.dart';
import 'package:e_comm/forms/transaction_forms/Hatchery_Transaction_Editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DailyEntryBloc/cubit/dailylist_cubit.dart';
import 'DeliveryBloc/cubit/deliverylist_cubit.dart';
import 'FarmBloc/cubit/farmslist_cubit.dart';
import 'HatcheryMasterBloc/cubit/masterhatcherylist_cubit.dart';
import 'HatcheryTransactionBloc/cubit/hatcherytransactionlist_cubit.dart';
import 'forms/master_forms/Hatchery_Master_List.dart';

class FormMenu extends StatefulWidget {
  @override
  _FormMenuState createState() => _FormMenuState();
}

class _FormMenuState extends State<FormMenu> {
  final List _list = [
    'FARMS\n(Master)',
    'HATCHERY\n(Master)',
    'CHICK TRANSFER\n(Transaction)',
    'DELIVERY\n(Transaction)',
    'HATCHERY\n(Transaction)',
    'DAILY ENTRY\n(Transaction)',
    'PICK UP\n(Transaction)',
    'VIEW REPORT',
    'REPORT BY BATCH'
  ];
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chick Farm'),
        backgroundColor: Colors.lightGreen.shade900,
        //backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),topRight:Radius.circular(20.0) )),
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  routing(index);
                },
                child: Center(
                  child: Text(
                    _list[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  routing(int index) {
    if (index == 0)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => FarmslistCubit(url: '')..fetchData(),
                    child: farmListWidget(),
                  )));
    else if (index == 1)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) =>
                        MasterhatcherylistCubit(url: '')..fetchData(),
                    child: MasterHatcheryWidget(),
                  )));
    else if (index == 2)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ChicktransferCubit(url: '')
                      ..fetchData(DateTime.now(),DateTime.now()),
                    child: ChickTransferList(),
                  )));
    else if (index == 3)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => DeliverylistCubit(url: '')
                      ..fetchData(DateTime.now(), DateTime.now()),
                    child: DeliveryListWidget(),
                  )));
    else if (index == 4)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => HatcherytransactionlistCubit(url: '')
                      ..fetchData(DateTime.now(), DateTime.now()),
                    child: HatcheryTransactionList(),
                  )));
    else if (index == 5)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => DailylistCubit(url: '')
                      ..fetchData(DateTime.now(), DateTime.now()),
                    child: DailyEntryWidget(),
                  )));
    else if (index == 6)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => PickuplistCubit(url: '')
                      ..fetchData(DateTime.now(), DateTime.now()),
                    child: PickupListWidget(),
                  )));
    else if (index == 7)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ReportblocCubit(url: '')..fetchData(DateTime.now(), DateTime.now()),
                child: View_Report(),
              )));
    else if (index == 8)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ReportByBatch()));


  }
}
