import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:nubiaville/utils/utils.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class FloatMenu extends StatefulWidget {
  const FloatMenu({Key? key}) : super(key: key);

  @override
  _FloatMenuState createState() => _FloatMenuState();
}

class _FloatMenuState extends State<FloatMenu> {
  TextEditingController dateinput = TextEditingController();
  final totalController = TextEditingController();
  final commentController = TextEditingController();
  late double deviceWidth, deviceHeight;
  Uint8List? _image;

  @override
  void initState() {
    dateinput.text = "";

    super.initState();
  }
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }



  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Expense',
            style: TextStyle(color: Colors.black,fontSize: 18),
          ),
          SizedBox(height: 20,),
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
          SizedBox(height: 20,),
          Text(
            'Total',
            style: TextStyle(color: Colors.black,fontSize: 12),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFd9d9e6)
            ),
            width: double.infinity,
            height: 35,
            child: TextFormField(
              controller: totalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                //hintText: "/$",
                // center labastyle
                labelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            'Date',
            style: TextStyle(color: Colors.black,fontSize: 12),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFd9d9e6)
            ),
            height: 35,
            child: TextFormField(
              controller: dateinput, //editing controller of this TextField
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
                    dateinput.text = formattedDate; //set output date to TextField value.
                  });
                }else{
                  print("Date is not selected");
                }
              },
            ),
          ),
          SizedBox(height: 20,),
          Text(
            'Comment',
            style: TextStyle(color: Colors.black,fontSize: 12),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFd9d9e6)
            ),
            width: double.infinity,
            height: 55,
            child: TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 34,
            width: 155,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFd9d9e6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              onPressed: selectImage,
              child: Text(
                "Select receipt".toUpperCase(),
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: _image != null
                ? CircleAvatar(
              radius: 64,
              backgroundImage: MemoryImage(_image!),
              backgroundColor: Colors.red,
            )
                : const SizedBox(),
          )




        ],
      ),
    );
  }
}
