// ignore_for_file: unused_import, file_names, unnecessary_new, prefer_const_constructors, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers, must_be_immutable, use_key_in_widget_constructors

import 'package:e_comm/Common_ui.dart';
import 'package:e_comm/baziercontainer.dart';
import 'package:e_comm/data_models/transactions/daily_entry_form.dart';
import 'package:e_comm/validate.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DailyEntry extends StatefulWidget {
  // DailyEntry({Key? key,required this.NumberDead,required this.AverageWeight}) : super(key: key);
  late DateTime date;
  late String BatchId;
  late String farmId;
  late num FeedQuantity;
  late num MedicineQuantity;
  late int NumberDead;
  late num AverageWeight;
  @override
  _DailyEntryState createState() => _DailyEntryState();
}

class _DailyEntryState extends State<DailyEntry> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  DailyEntryFormDataModel model = DailyEntryFormDataModel.empty();
  TextEditingController pickInputcontroller =  TextEditingController();
  TextEditingController batchInputcontroller =  TextEditingController();
  TextEditingController farmidInputcontroller =  TextEditingController();
  TextEditingController feedQtyInputcontroller =  TextEditingController();
  TextEditingController medicineQtyInputcontroller =  TextEditingController();
  TextEditingController deadInputcontroller =  TextEditingController();
  TextEditingController weightInputcontroller =  TextEditingController();

  late DateTime date;
  late String date1;
  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Entry'),
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
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
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
                                  model.date = value! as DateTime;
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
                              model.BatchId = value!;
                            },
                            controller: batchInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Batch ID',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.confirmation_num_outlined,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //   decoration: BoxDecoration(
                        //     color: Colors.orange[100],
                        //     borderRadius: BorderRadius.circular(25),
                        //   ),
                        //   child: TextFormField(
                        //     validator: (value) {
                        //       return Validate.txtValidator(value!);
                        //     },
                        //     onSaved: (String? value) {
                        //       model.farmId = value!;
                        //     },
                        //     controller: farmidInputcontroller,
                        //     keyboardType: TextInputType.text,
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: 'Farm ID',
                        //       hintStyle: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.black38),
                        //       icon: Icon(
                        //         Icons.production_quantity_limits,
                        //         color: Colors.black38,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
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
                              model.FeedQuantity = value! as num;
                            },
                            controller: feedQtyInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Feed Quantity',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.monitor_weight,
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
                              model.MedicineQuantity = value! as num;
                            },
                            controller: medicineQtyInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Medicine Quantity',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.monitor_weight,
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
                              model.NumberDead = value! as int;
                            },
                            controller: deadInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Number Dead',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.monitor_weight,
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
                              model.AverageWeight = value! as num;
                            },
                            controller: weightInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Average Weight',
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
          Box box = Hive.box('Farm');
          model.date = selectedDate;
          model.BatchId = box.get('BatchID').toString();
          model.farmId = box.get('FarmID');
          model.FeedQuantity = double.parse(feedQtyInputcontroller.text);
          model.MedicineQuantity =
              double.parse(medicineQtyInputcontroller.text);
          model.NumberDead = int.parse(deadInputcontroller.text);
          model.AverageWeight = double.parse(weightInputcontroller.text);
          print('Data : ${model.toJson()}');
          await web.saveRecord(model: model);
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
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
