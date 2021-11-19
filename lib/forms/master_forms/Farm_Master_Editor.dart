// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_collection_literals, use_key_in_widget_constructors, unnecessary_import, prefer_const_literals_to_create_immutables

import 'package:e_comm/Common_ui.dart';
import 'package:e_comm/data_models/master/farm.dart';
import 'package:e_comm/validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:uuid/uuid.dart';

class FarmMaster extends StatefulWidget {
  late String farmname;
  late String location;
  late int capacity;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;

  @override
  _FarmMasterState createState() => _FarmMasterState();
}

class _FarmMasterState extends State<FarmMaster> {
  var uuid=Uuid();

  Map<String, String> selectedValueMap = Map();
  DateTime selectedDate = DateTime.now();
  late String date;
  late String date1;
  late String farmname;
  late String location;
  late int capacity;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;

  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  void _save() {
    final isValid = _FormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _FormKey.currentState!.save();
  }

  FarmDataModel model = FarmDataModel.empty();
  TextEditingController pastpickcontroller = TextEditingController();
  TextEditingController dateInputcontroller = TextEditingController();
  TextEditingController capacityInputcontroller = TextEditingController();
  TextEditingController farmInputcontroller = TextEditingController();
  TextEditingController locationInputcontroller = TextEditingController();
  TextEditingController ledgerInputcontroller = TextEditingController();
  TextEditingController batchInputcontroller = TextEditingController();



  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Farm'),
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
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 155.0),
                          child: Container(
                           // margin: EdgeInsets.symmetric(horizontal: 10),
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen.shade900,
                              borderRadius: BorderRadius.circular(00)
                            ),


                            child: TextFormField(
                              validator: (value) {
                                return Validate.txtValidator(value!);
                              },
                              onSaved: (String? value) {
                                model.FarmName = value!;
                              },
                              keyboardType: TextInputType.text,
                              controller: farmInputcontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Farm Name : ',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),

                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                              model.location = value!;
                            },
                            keyboardType: TextInputType.text,
                            controller: locationInputcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Location',
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
                              model.capacity = value as int;
                            },
                            controller: capacityInputcontroller,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // ignore: deprecated_member_use
                             // WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Capacity',
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
                        //       model.attenderLedger = value!;
                        //     },
                        //     keyboardType: TextInputType.text,
                        //     controller: ledgerInputcontroller,
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: 'Attender Ledger',
                        //       hintStyle: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.black38),
                        //       icon: Icon(
                        //         Icons.note_add,
                        //         color: Colors.black38,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // DropdownButtonFormField(
                        //   value: attenderLedger,
                        //   hint: Text('Attender Ledger'),
                        //   onChanged: (led)=>
                        //       setState(()=> attenderLedger=led.toString(),
                        //       ),
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(15.0)
                        //       )
                        //   ),
                        //   validator: (value)=>
                        //   value==null?"field required":null,
                        //   items: [
                        //     'aaa','bbb','ccc'
                        //   ].map<DropdownMenuItem<String>>((String value)
                        //   {
                        //     return DropdownMenuItem(child: Text(value),
                        //       value: value,
                        //     );
                        //
                        //   }).toList(),
                        // ),
                        //

                        SizedBox(
                          height: 200,
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
                        //       model.currentBatchId = value!;
                        //     },
                        //     keyboardType: TextInputType.text,
                        //     controller: batchInputcontroller,
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: 'Current Batch Id',
                        //       hintStyle: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.black38),
                        //       icon: Icon(
                        //         Icons.batch_prediction,
                        //         color: Colors.black38,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //   decoration: BoxDecoration(
                        //     color: Colors.orange[100],
                        //     borderRadius: BorderRadius.circular(25),
                        //   ),
                        //   child: InkWell(
                        //     onTap: () {
                        //       _selectDate(context);
                        //     },
                        //     child: IgnorePointer(
                        //       child: TextFormField(
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           hintText: 'Current Date',
                        //           hintStyle: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black38),
                        //           icon: Icon(
                        //             Icons.calendar_today_outlined,
                        //             color: Colors.black38,
                        //           ),
                        //         ),
                        //         onSaved: (String? value) {
                        //           model.currentDate = (value ?? "") as DateTime?;
                        //         },
                        //         controller: dateInputcontroller,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //   decoration: BoxDecoration(
                        //     color: Colors.orange[100],
                        //     borderRadius: BorderRadius.circular(25),
                        //   ),
                        //   child: InkWell(
                        //     onTap: () {
                        //       _selectDate1(context);
                        //     },
                        //     child: IgnorePointer(
                        //       child: TextFormField(
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           hintText: 'Past Pickup Date',
                        //           hintStyle: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black38),
                        //           icon: Icon(
                        //             Icons.calendar_today_outlined,
                        //             color: Colors.black38,
                        //           ),
                        //         ),
                        //         onSaved: (String? value) {
                        //           model.pastPickupDate = value! as DateTime;
                        //         },
                        //         controller: pastpickcontroller,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 30,
                        // )
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
          uuid.v4();
          if (_FormKey.currentState!.validate()) {}
          //  print (capacityInputcontroller.text);
          model.FarmName = farmInputcontroller.text;
          model.location = locationInputcontroller.text;
          model.capacity = int.parse(capacityInputcontroller.text);
          model.attenderLedger = ledgerInputcontroller.text;
          model.currentBatchId = batchInputcontroller.text;
          model.currentDate = selectedDate;
          model.pastPickupDate = selectedDate;
          print('Data : ${model.toJson()}');
          await web.farmRecord(model: model);
        },
        child: Icon(Icons.check_outlined),
        backgroundColor: Colors.lightGreen.shade900,      ),
    );
  }

  // _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null)
  //     // ignore: curly_braces_in_flow_control_structures
  //     setState(() {
  //       selectedDate = picked;
  //       date = selectedDate.toString();
  //       dateInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
  //     });
  // }

  // _selectDate1(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null)
  //     // ignore: curly_braces_in_flow_control_structures
  //     setState(() {
  //       selectedDate = picked;
  //       date1 = selectedDate.toString();
  //       pastpickcontroller.text = DateFormat.yMMMd().format(selectedDate);
  //     });
  // }

}
