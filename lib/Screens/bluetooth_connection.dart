import 'package:flutter/material.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothConnection extends StatefulWidget {
  @override
  State<BluetoothConnection> createState() => BluetoothConnectionState();
}

class BluetoothConnectionState extends State<BluetoothConnection> {
  //List<BluetoothDevice> devices = [];
  List<ScanResult> device=[];
  bool isScanning =true;


  @override
  void initState() {
    super.initState();
    startScanning();
    //loadBluetoothDevice();
  }

  void startScanning() async {
    await FlutterBluePlus.startScan();
    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        device = results;
      });
    }).onDone((){
      setState(() {
        isScanning = false;
      });
    });
  }

  void connectToDevice(BluetoothDevice device)async{
    await device.connect();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Connected")),
    );
  }

  // void loadBluetoothDevice() {
  //   setState(() {
  //     devices = [
  //       mockBluetoothDevice("Soil Sensor"),
  //       mockBluetoothDevice("Temperature & Moisture Sensor"),
  //     ];
  //   });
  // }

  // BluetoothDevice mockBluetoothDevice(String id,) {
  //   return BluetoothDevice(remoteId: DeviceIdentifier(id));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Connection"),
        backgroundColor: Colors.lightBlue.shade100,
      ),
      body: ListView.builder(
        itemCount: device.length,
        itemBuilder: (context, index) {
          final devices = device[index].device;
          return ListTile(
            title: Text(devices.platformName, style: TextStyle(fontSize: 20),),
            subtitle: Text(devices.remoteId.str),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: startScanning,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
