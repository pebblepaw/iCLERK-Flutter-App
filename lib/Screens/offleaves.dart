import 'package:flutter/material.dart';
import 'calendarmain.dart';
import 'package:hackathon/Screens/formscreen.dart';


class Offleaves extends StatefulWidget {
  const Offleaves({Key? key}) : super(key: key);

  @override
  _OffleavesState createState() => _OffleavesState();
}

class _OffleavesState extends State<Offleaves> {
  DateTimeRange? _selectedDateRange;
  int leavesLeft = 14;

  // This function will be triggered when the floating button is pressed
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leaves'),
            backgroundColor: const Color(0xFF19294E)
        ),
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
                          child:  Text(
                            "Leaves left: $leavesLeft",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,),
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
                const SizedBox(height: 50,),
                FloatingActionButton.extended(
                  heroTag: "btn3",
                  backgroundColor: const Color(0xC319294E),
                  elevation: 0,
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Leave applied',),
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