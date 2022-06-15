import 'package:flutter/material.dart';
import 'package:hackathon/Screens/ViewStatus.dart';
import 'package:hackathon/Screens/offleaves.dart';
import 'package:hackathon/Screens/qr.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
            const SizedBox(width: 130,),
            const SizedBox(
                width: 100,
                height: 40,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
            ),
            const SizedBox(width: 95,),
            SizedBox(
              width: 25,
              child: IconButton(
                  icon: const Icon(
                    Icons.check_circle_outline_rounded,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const qr()),
                    );
                  },
              )
            ),
          ]
        ),
        backgroundColor: const Color(0xFF19294E),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 00, 0, 20),
                  child: Image.asset(
                    'assets/images/nsf.png',
                    fit: BoxFit.fitWidth,
                    height: 200,
                  )
                  //margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),

                  ),
              Card(
                  child: Column(
                children: const [
                  ListTile(
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
                  Divider(),
                  ListTile(
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
                  Divider(),
                  ListTile(
                    subtitle: Text('Current Ongoing Status'),
                    title: Text(
                      '5',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.local_hospital,
                      color: Color(0xFF19294E),
                    ),
                  ),
                  /*Container(
                    padding: const EdgeInsets.all(10),
                    //margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: const Text("Rank/ Name: CPL John Smith",
                        style: TextStyle(fontSize: 20)),
                  ),*/
                  //const Divider(),
                ],
              )),
              Container(
                //padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  backgroundColor: const Color(0xC319294E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewStatus()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text("View Status"),
                ),
              ),
              FloatingActionButton.extended(
                heroTag: "btn2",
                backgroundColor: const Color(0xC319294E),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Offleaves()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: const Text("View Leaves"),
              ),
            ]
        ),
      ),
    );
  }
}
