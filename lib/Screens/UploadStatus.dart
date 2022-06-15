import 'package:flutter/material.dart';
import 'package:hackathon/Screens/UploadPhoto.dart';

class UploadStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UploadState();
  }
}

class UploadState extends State<UploadStatus> {
  DateTimeRange? _selectedDateRange;

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      helpText: "Choose the days",
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }
  String dropdownvalue = 'NIL';

  var items = [
    'NIL',
    'Excuse RMJ',
    'Excuse Outfield',
    'Excuse Manning',
    'Excuse Fire-arms',
    'Excuse Stay-In',
    'Excuse Boots',
    'Excuse Shrimp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Status"),
          backgroundColor: const Color(0xFF19294E),),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Card(
            child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ListTile(
                subtitle: Text('Rank/ Name'),
                title: Text(
                  'CPL John Smith',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color(0xFF19294E),
                ),
              ),

              const ListTile(
                subtitle: Text('Unit'),
                title: Text(
                  '110 C4I',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(
                  Icons.house_rounded,
                  color: Color(0xFF19294E),
                ),
              ),

              const Divider(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          "Choose Status:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,),
                          //iconSize: 42,
                          //underline: SizedBox(),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  style: const TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 26, 0),
                    child: const Text(
                      "Select dates:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FloatingActionButton.extended(
                    heroTag: "btn1",
                    backgroundColor: const Color(0xC319294E),
                    elevation: 0,
                    onPressed: _show,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: const Icon(Icons.date_range),
                  ),
                ]),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
                      //textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 17, color: Colors.grey)),
                ),
              ),
              Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 20)),
              const SizedBox(height: 50,),
              FloatingActionButton.extended(
                heroTag: "btn2",
                backgroundColor: const Color(0xC319294E),
                elevation: 0,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadPhoto()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: const Text("Upload File",
                    style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 50,),
              FloatingActionButton.extended(
                heroTag: "btn3",
                backgroundColor: const Color(0xC319294E),
                elevation: 0,
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Status submitted'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ],
          )
        ),
      ),
    );
  }
}
