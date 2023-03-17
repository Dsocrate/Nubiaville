import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubiaville/Resources/Dropdownmenu.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
class DropDown extends StatefulWidget {
  bool Expanded = false;

  DropDown({required this.Expanded});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final format = DateFormat("MM/dd/yyyy");
  TextEditingController fromdateinput = TextEditingController();
  TextEditingController todateinput = TextEditingController();
  final minController = TextEditingController();
  final maxController = TextEditingController();
  late double deviceWidth, deviceHeight;
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;

  @override
  void initState() {
    fromdateinput.text = "";
    todateinput.text = "";

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFf5f7fa),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From',
                style: TextStyle(color: Colors.black87,fontSize: 15),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFd9d9e6)
                ),
                height: 35,
                child: TextFormField(
                  controller: fromdateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "" ,
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        fromdateinput.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
              ),
              Text(
                'To',
                style: TextStyle(color: Colors.black87,fontSize: 15),
              ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFd9d9e6)
              ),
              height: 35,
              child: TextFormField(
                controller: todateinput, //editing controller of this TextField
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "" ,
                  border: OutlineInputBorder(),
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      todateinput.text = formattedDate; //set output date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              ),
            ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Min',
                        style: TextStyle(color: Colors.black87,fontSize: 15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFd9d9e6)
                        ),
                        width: deviceWidth *0.42,
                        height: 35,
                        child: TextFormField(
                          controller: minController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                            // center labastyle
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 3,
                    thickness: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Max',
                        style: TextStyle(color: Colors.black87,fontSize: 15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFd9d9e6)
                        ),
                        width: deviceWidth *0.42,
                        height: 35,
                        child: TextFormField(
                          controller: minController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                            // center labastyle
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFd9d9e6)
                ),
                height: 50,
                child: DropdownSearch<String>(
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem ?? "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12
                      ),
                    );
                  },
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),

                    ),
                    items: ["Rental car", "Restaurant", "BreakFast", 'Parking','Airline','Office supplies','Electronics','Taxi','Hotel','Ride sharing','Shuttle','Fast Food'],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Merchant",
                        hintText: "Choose your merchants",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                        )
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "",


                  ),
              ),
              SizedBox(height: 25,),
              Text(
                'Status',
                style: TextStyle(color: Colors.black87,fontSize: 17),
              ),

              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                        value: _isChecked1,
                        onChanged: (val) {
                          setState(() {
                            _isChecked1 = val;
                          });
                        },
                      ),
                      Text('New',style: TextStyle(fontSize: 12,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                        value: _isChecked2,
                        onChanged: (val) {
                          setState(() {
                            _isChecked2 = val;
                          });
                        },
                      ),
                      Text('In Progress',style: TextStyle(fontSize: 12,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                        value: _isChecked3,
                        onChanged: (val) {
                          setState(() {
                            _isChecked3 = val;
                          });
                        },
                      ),
                      Text('Reimbursed',style: TextStyle(fontSize: 12,color: Colors.black),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                TextButton(
                    onPressed: (){},
                    child: Text(
                      'Clear Filters',
                      style: TextStyle(color: Colors.blue,fontSize: 15),
                    ),),
                Container(
                  height: 30,
                  width: 75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFd9d9e6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    onPressed: () {setState(() {
                      widget.Expanded = !widget.Expanded;
                    });
                    },
                    child: Text(
                      "Done".toUpperCase(),
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ),
                )


              ],)

            ],
          ),
        ),
      ),
    );
  }

}

