// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:e_comm/PickUpBloc/cubit/pickuplist_cubit.dart';
import 'package:e_comm/forms/transaction_forms/DateFilter.dart';
import 'package:e_comm/forms/transaction_forms/Pickup_Transaction_Editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PickupListWidget extends StatefulWidget {
  const PickupListWidget({Key? key}) : super(key: key);

  @override
  _PickupListWidgetState createState() => _PickupListWidgetState();
}

class _PickupListWidgetState extends State<PickupListWidget> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PickUp List"),
        backgroundColor: Colors.lightGreen.shade900,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PickUp()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Column(
        children:[
          SizedBox(height: 10,),
          Flexible(
              flex:2,
              child: DateFilter(datesSelected: (fromDate1, toDate1) {
                fromDate=fromDate1;
                toDate = toDate1;
                BlocProvider.of<PickuplistCubit>(context).fetchData(fromDate, toDate);
              },fromDate: fromDate ,toDate: toDate,)),
      Flexible(
        flex: 25,
        child: BlocBuilder<PickuplistCubit, PickuplistState>(
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
                            child: Text(data[index]['_source']['FarmId']??'NO TAG',
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PickUp()));
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
      ]
      ),
    );
  }
}
