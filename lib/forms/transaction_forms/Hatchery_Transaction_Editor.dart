// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable


import 'package:e_comm/Common_ui.dart';
import 'package:e_comm/data_models/transactions/hatchery.dart';
import 'package:e_comm/validate.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Hatchery extends StatefulWidget {
  late String createBatch;
   late DateTime date;
  late String chooseHatchery;
  late num numberOfeggs;
  late String chickProduced;
   late DateTime pickUpdate;
   late String FarmId;
  @override
  _HatcheryState createState() => _HatcheryState();
}

class _HatcheryState extends State<Hatchery> {
  DateTime selectedDate = DateTime.now();
  late String date1;
  late String date2;
  late String createBatch;
   late DateTime date;
  late String chooseHatchery;
  late num numberOfeggs;
  late String chickProduced;
  late DateTime pickUpdate;
  late String FarmId;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  TransactionHatecheryDataModel hatchery =
      TransactionHatecheryDataModel.empty();
  TextEditingController dateInputcontroller =  TextEditingController();
  TextEditingController pickInputcontroller =  TextEditingController();
  TextEditingController batchInputcontroller =  TextEditingController();
  TextEditingController hatcheryInputcontroller =  TextEditingController();
  TextEditingController eggsInputcontroller =  TextEditingController();
  TextEditingController chickproduceInputcontroller = TextEditingController();
TextEditingController farminputcontroller=TextEditingController();
  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hatchery Transaction'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: height * .2),
                        SizedBox(height: 50),
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
                              hatchery.createBatch = value!;
                            },
                            controller: batchInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' Create Batch',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.home_work_outlined,
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
                                  hatchery.date = value! as DateTime;
                                },
                                controller: dateInputcontroller,
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
                              hatchery.FarmId = value!;
                            },
                            controller: farminputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'FarmId',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.location_on_sharp,
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
                              hatchery.chooseHatchery = value!;
                            },
                            controller: hatcheryInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Choose Hatchery',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.location_on_sharp,
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
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              return Validate.txtValidator(value!);
                            },
                            onSaved: (String? value) {
                              hatchery.numberOfeggs = value! as num;
                            },
                            controller: eggsInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'No.Of Eggs',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.reduce_capacity_rounded,
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
                              hatchery.chickProduced = value!;
                            },
                            controller: chickproduceInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Chick Produced',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.note_add,
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
                          child: InkWell(
                            onTap: () {
                              _selectDate1(context);
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'PickUp Date',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                  icon: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.black38,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  hatchery.pickUpdate = value! as DateTime;
                                },
                                controller: pickInputcontroller,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
          if (_FormKey.currentState!.validate()) {}
          hatchery.createBatch = batchInputcontroller.text;
          hatchery.date = selectedDate;
          hatchery.chooseHatchery = hatcheryInputcontroller.text;
          hatchery.numberOfeggs = double.parse(eggsInputcontroller.text);
          hatchery.chickProduced = chickproduceInputcontroller.text;
          hatchery.pickUpdate = selectedDate;
          hatchery.FarmId = farminputcontroller.text;

          print('Data : ${hatchery.toJson()}');
          await web.tHatcheryRecord(model: hatchery);
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
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = picked;
        date1 = selectedDate.toString();
        dateInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }

  _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = picked;
        date2 = selectedDate.toString();
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
