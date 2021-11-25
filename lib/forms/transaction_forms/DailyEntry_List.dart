// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, non_constant_identifier_names, annotate_overrides, avoid_print

import 'package:e_comm/DailyEntryBloc/cubit/dailylist_cubit.dart';
import 'package:e_comm/forms/transaction_forms/DailyEntry_Editor.dart';
import 'package:e_comm/forms/transaction_forms/DateFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class DailyEntryWidget extends StatefulWidget {
  @override
  _DailyEntryWidgetState createState() => _DailyEntryWidgetState();
}

class _DailyEntryWidgetState extends State<DailyEntryWidget> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  late Box box;
  void initState() {
    super.initState();
    box = Hive.box('Farm');
    setState(() {});
  }

  _addInfo() {
    box.put('FarmName', 'FarmName');
    box.put('FarmID', 'FarmId');
    print('Added');
  }

  _getInfo() {
    // var FarmName = box.get('FarmName');
    // var FarmId = box.get('FarmId');
    var farmdata=box.get('FarmData');
    print('Info retrieved from box: $farmdata');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Entry Form"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getInfo();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DailyEntry()));
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
                datesSelected: (fromDate1, toDate1) {
                  fromDate = fromDate1;
                  toDate = toDate1;
                  BlocProvider.of<DailylistCubit>(context)
                      .fetchData(fromDate, toDate);
                },
                fromDate: fromDate,
                toDate: toDate,
              )),
          Flexible(
            flex: 25,
            child: BlocBuilder<DailylistCubit, DailylistState>(
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
                                data[index]['_source']['farmId'] ?? 'NO TAG',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 0.0),
                            dense: true,
                            //tileColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            selected: true,
                            selectedTileColor: Colors.orange[100],
                            onTap: () {
                              box.put('FarmName',
                                  data[index]['_source']['FarmName']);
                              box.put('FarmID', data[index]['_id']);
                              print('Info Added');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DailyEntry()));
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
