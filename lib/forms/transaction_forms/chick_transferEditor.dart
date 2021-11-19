// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:e_comm/Common_ui.dart';
import 'package:e_comm/data_models/transactions/chick_transfer.dart';
import 'package:e_comm/validate.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChickTransfer extends StatefulWidget {
  late DateTime Date;
  late String FarmId;
  late String FarmName;
  late int NumberOfChickens;
  late String BatchId;
  @override
  _ChickTransferState createState() => _ChickTransferState();
}

class _ChickTransferState extends State<ChickTransfer> {
  DateTime selectedDate = DateTime.now();
  late String date1;
  late DateTime Date;
  late String FarmId;
  late String FarmName;
  late int numberOfChickens;
  late String BatchId;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  ChickTransferDataModel chick = ChickTransferDataModel.empty();
  TextEditingController pickInputcontroller = new TextEditingController();
  TextEditingController farmidInputcontroller = new TextEditingController();
  TextEditingController farmnameInputcontroller = new TextEditingController();
  TextEditingController numberofchickInputcontroller = new TextEditingController();
  TextEditingController batchInputcontroller = new TextEditingController();
  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chick Transfer'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  key: _FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: kBoxdecorationStyle,
                        child: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: IgnorePointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Date',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.black38,
                                ),
                              ),
                              onSaved: (String? value) {
                                chick.Date = value! as DateTime;
                              },
                              controller: pickInputcontroller,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: kBoxdecorationStyle,
                        child: TextFormField(
                          validator: (value) {
                            return Validate.txtValidator(value!);
                          },
                          onSaved: (String? value) {
                            chick.FarmId = value!;
                          },
                          controller: farmidInputcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Farm Id',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                            icon: Icon(
                              Icons.batch_prediction,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: kBoxdecorationStyle,
                        child: TextFormField(
                          validator: (value) {
                            return Validate.txtValidator(value!);
                          },
                          onSaved: (String? value) {
                            chick.FarmName = value!;
                          },
                          controller: farmnameInputcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Farm Name',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                            icon: Icon(
                              Icons.batch_prediction,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: kBoxdecorationStyle,
                        child: TextFormField(
                          validator: (value) {
                            return Validate.txtValidator(value!);
                          },
                          onSaved: (String? value) {
                            chick.NumberOfChickens = value! as int;
                          },
                          controller: numberofchickInputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Number of Chicks',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                            icon: Icon(
                              Icons.batch_prediction,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: kBoxdecorationStyle,
                        child: TextFormField(
                          validator: (value) {
                            return Validate.txtValidator(value!);
                          },
                          onSaved: (String? value) {
                            chick.BatchId = value!;
                          },
                          controller: batchInputcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Batch Id',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                            icon: Icon(
                              Icons.batch_prediction,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.lightGreen,

        onPressed: () async {
          chick.Date = selectedDate;
          print('selected date $selectedDate');
          chick.FarmId = farmidInputcontroller.text;
          chick.FarmName = farmnameInputcontroller.text;
          chick.NumberOfChickens = int.parse(numberofchickInputcontroller.text);
          chick.BatchId = batchInputcontroller.text;
          print('Data : ${chick.toJson()}');
          await web.chickRecord(model: chick);
        },
        child: Icon(Icons.check_outlined),
        backgroundColor: Colors.lightGreen.shade900,
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        date1 = selectedDate.toString();
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
