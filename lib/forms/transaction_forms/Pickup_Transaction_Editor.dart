// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers, use_key_in_widget_constructors
import 'package:e_comm/Common_ui.dart';
import 'package:e_comm/data_models/transactions/pickup.dart';
import 'package:e_comm/validate.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickUp extends StatefulWidget {
  late DateTime date;
  late String BatchId;
  late String FarmId;
  late num Weight;
  late num BalanceFeed;
  late num BalanceMedicine;
  late num ExpectedWeight;
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  PickUpDataModel pick = PickUpDataModel.empty();
  TextEditingController dateInputcontroller =  TextEditingController();
  TextEditingController batchInputcontroller =  TextEditingController();
  TextEditingController farmidInputcontroller =  TextEditingController();
  TextEditingController balancefeedInputcontroller =
       TextEditingController();
  TextEditingController balancemedicineInputcontroller =
       TextEditingController();
  TextEditingController weightInputcontroller =  TextEditingController();
  TextEditingController expectweightInputcontroller =
       TextEditingController();
  late DateTime date;
  late String date1;

  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Up'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              // Positioned(
              //   top: -MediaQuery.of(context).size.height * .15,
              //   right: -MediaQuery.of(context).size.width * .4,
              //   child: BezierContainer(),
              // ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  key: _FormKey,
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
                                pick.date = value as DateTime;
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
                            pick.BatchId = value!;
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
                              Icons.production_quantity_limits,
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
                            pick.FarmId = value!;
                          },
                          controller: farmidInputcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Farm ID',
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
                            pick.Weight = value! as num;
                          },
                          controller: weightInputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Weight',
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
                            pick.BalanceFeed = value! as num;
                          },
                          controller: balancefeedInputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Balance Feed',
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
                            pick.BalanceMedicine = value! as num;
                          },
                          controller: balancemedicineInputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Balance Medicine',
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
                            pick.ExpectedWeight = value! as num;
                          },
                          controller: expectweightInputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Expected Weight',
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
          pick.date = selectedDate;
          pick.BatchId = batchInputcontroller.text;
          pick.FarmId = farmidInputcontroller.text;
          pick.Weight = double.parse(weightInputcontroller.text);
          pick.BalanceFeed = double.parse(balancefeedInputcontroller.text);
          pick.BalanceMedicine =
              double.parse(balancemedicineInputcontroller.text);
          pick.ExpectedWeight = double.parse(expectweightInputcontroller.text);
          print('Data : ${pick.toJson()}');
          await web.pickupRecord(model: pick);
        },
        child: Icon(Icons.check_outlined),
        backgroundColor: Colors.lightGreen.shade900,      ),
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
}
