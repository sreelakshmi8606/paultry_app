// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:e_comm/HatcheryTransactionBloc/cubit/hatcherytransactionlist_cubit.dart';
import 'package:e_comm/forms/transaction_forms/DateFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Hatchery_Transaction_Editor.dart';

class HatcheryTransactionList extends StatefulWidget {
  const HatcheryTransactionList({Key? key}) : super(key: key);

  @override
  _HatcheryTransactionListState createState() =>
      _HatcheryTransactionListState();
}

class _HatcheryTransactionListState extends State<HatcheryTransactionList> {

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hatchery List"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Hatchery()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,      ),
      body: Column(
        children:[
          SizedBox(height: 10,),
          Flexible(
          flex:2,
          child: DateFilter(datesSelected: (fromDate1, toDate1) {
            fromDate=fromDate1;
            toDate = toDate1;
            BlocProvider.of<HatcherytransactionlistCubit>(context).fetchData(fromDate, toDate);
          },fromDate: fromDate ,toDate: toDate,)),
          Flexible(
            flex: 25,
            child: BlocBuilder<HatcherytransactionlistCubit,
              HatcherytransactionlistState>(
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
                        elevation: 10,
                        child: ListTile(
                          title: Center(
                            child: Text(data[index]['_source']['chooseHatchery']??'NO TAG',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
                          dense: true,
                          //tileColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          selected: true,
                          selectedTileColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hatchery()));
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
