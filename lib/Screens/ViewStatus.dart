import 'package:flutter/material.dart';
import 'package:hackathon/Screens/UploadStatus.dart';

class ViewStatus extends StatelessWidget {
  const ViewStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Status"),
        backgroundColor: const Color(0xFF19294E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            height: 80,
            color: Colors.green[100],
            child: const Center(
                child: Text(
                    'EXCUSE RMJ\nDate: 10 June 2022 to 21 June 2022\nLocation: Pasir Laba Medical Centre\nStatus: Ongoing')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.green[100],
            child: const Center(
                child: Text(
                    'EXCUSE OUTFIELD\nDate: 21 May 2022 to 21 August 2022\nLocation: Pasir Laba Medical Centre\nStatus: Ongoing')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.red[100],
            child: const Center(
                child: Text(
                    'EXCUSE BOOTS\nDate: 1 March 2022 to 1 June 2022\nLocation: Pasir Laba Medical Centre\nStatus: Expired')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.green[100],
            child: const Center(
                child: Text(
                    'EXCUSE PRAWN\nDate: 1 Jan 2022 to 1 Jan 2099\nLocation: Pasir Laba Medical Centre\nStatus: Permanent')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.red[100],
            child: const Center(
                child: Text(
                    'EXCUSE MANNING\nDate: 1 Jan 2022 to 1 Feb 2022\nLocation: Pasir Laba Medical Centre\nStatus: Expired')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.red[100],
            child: const Center(
                child: Text(
                    'EXCUSE RMJ\nDate: 12 Dec 2021 to 12 Jan 2022\nLocation: Pasir Laba Medical Centre\nStatus: Expired')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.green[100],
            child: const Center(
                child: Text(
                    'EXCUSE COMBAT RATIONS\nDate: 12 Dec 2021 to 1 Jan 2099\nLocation: Pasir Laba Medical Centre\nStatus: Permanent')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.red[100],
            child: const Center(
                child: Text(
                    'EXCUSE STAY-IN\nDate: 9 Nov 2022 to 9 Dec 2022\nLocation: Pasir Laba Medical Centre\nStatus: Expired')),
          ),
          const Divider(),
          Container(
            height: 80,
            color: Colors.green[100],
            child: const Center(
                child: Text(
                    'EXCUSE FIREARMS\nDate: 1 March 2022 to 1 Jan 2099\nLocation: Pasir Laba Medical Centre\nStatus: Permanent')),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        heroTag: "btn2",
        backgroundColor: const Color(0xC319294E),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadStatus()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
