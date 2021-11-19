// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures, override_on_non_overriding_member, must_be_immutable, avoid_print

import 'package:e_comm/ChickBloc/cubit/chicktransfer_cubit.dart';
import 'package:e_comm/FarmBloc/cubit/farmslist_cubit.dart';
import 'package:e_comm/ReportBloc/reportbloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DateFilter.dart';

class View_Report extends StatefulWidget {
  late int NumberOfChicken;
  late int Numberdead;
  late int AverageWeight;
  @override
  _View_ReportState createState() => _View_ReportState();
}

class _View_ReportState extends State<View_Report> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  late int NumberOfChicken;
  late int Numberdead;
  late int AverageWeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
        backgroundColor: Colors.orangeAccent,
      ),
      // body: reportBuilder(context, state),
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
                  BlocProvider.of<ReportblocCubit>(context)
                      .fetchData(fromDate, toDate);
                },
                fromDate: fromDate,
                toDate: toDate,
              )),
          SizedBox(
            height: 15,
          ),
          Flexible(
            flex: 25,
            child: BlocBuilder<ReportblocCubit, ReportblocState>(
              builder: (context, state) {
                if (state is reportFetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is reportError) {
                  return Center(
                    child: Text(state.msg),
                  );
                } else if (state is reportReady ) {
                  final List data = state.data;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ExpansionTile(
                            title: Center(
                              child: Text(
                                data[index]['_source']['FarmName'] ?? 'NO TAG',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            children: [
                              Text(
                                //data[index]['NumberOfChicken'],
                                'NumberOfChicken : 34',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'NumberOfDead : 22',
                                //data[index]['Numberdead'],
                                //"${data.NumberDead}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'AverageWeight : 100',
                                //data[index]['AverageWeight'],
                                // "${user.AverageWeight}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                            //dense: true,
                            //tileColor: Colors.orangeAccent,
                            // shape: RoundedRectangleBorder(
                            //borderRadius: BorderRadius.circular(10.0)),
                            // selected: true,
                            //selectedTileColor: Colors.grey[350],
                            //minLeadingWidth: 10,
                            //onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FarmMaster()));
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
