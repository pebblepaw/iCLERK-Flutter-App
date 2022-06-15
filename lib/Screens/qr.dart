import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qr extends StatefulWidget {
  const qr({Key? key}) : super(key: key);

  @override
  State<qr> createState() => _qrState();
}

class _qrState extends State<qr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Attendance"),
          backgroundColor: const Color(0xFF19294E),
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
                width: 300,
                child: Text(
                  'Please present this to your in-charge to record your attendance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 300,
                width: 300,
                child: QrImage(
                  data: "https://www.youtube.com/watch?v=iik25wqIuFo",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
    );
  }
}
