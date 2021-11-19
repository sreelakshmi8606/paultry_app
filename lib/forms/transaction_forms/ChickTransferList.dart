// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print

import 'package:e_comm/ChickBloc/cubit/chicktransfer_cubit.dart';
import 'package:e_comm/forms/transaction_forms/DateFilter.dart';
import 'package:e_comm/forms/transaction_forms/chick_transferEditor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_comm/form_menu.dart';

import 'package:intl/intl.dart';

class ChickTransferList extends StatefulWidget {
  const ChickTransferList({Key? key}) : super(key: key);

  @override
  _ChickTransferListState createState() => _ChickTransferListState();
}

class _ChickTransferListState extends State<ChickTransferList> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chick Transfer List"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChickTransfer()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Flexible(
              flex: 2,
              child: DateFilter(
                datesSelected: (fromDate, toDate) {
                  print('$fromDate');
                  fromDate = fromDate;
                  toDate = toDate;
                  print('fromdate11 $fromDate');
                  BlocProvider.of<ChicktransferCubit>(context)
                      .fetchData(fromDate, toDate);
                },
                fromDate: fromDate,
                toDate: toDate,
              )),
          Flexible(
            flex: 25,
            child: BlocBuilder<ChicktransferCubit, ChicktransferState>(
              builder: (context, state) {
                if (state is Fetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FetchError) {
                  return Center(
                    child: Text(state.msg),
                  );
                } else if (state is FetchCompleted) {
                  final List data = state.data;
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Center(
                              child: Text(
                                data[index]['_source']['FarmName'] ?? 'NO TAG',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 0.0),
                            dense: true,
                            //tileColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            selected: true,
                            selectedTileColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChickTransfer()));
                            },
                          ),
                        );
                      });
                } else
                  return Center(
                    child: Text('Undefined State'),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
