import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrugTile extends StatelessWidget {
  final String name;
  final String schedule;
  final Function deleteCall;

  DrugTile({this.name, this.deleteCall, this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Color(0xFF041955)),
      child: ListTile(
        onLongPress: deleteCall,
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.medical_services_outlined,
          color: Colors.white,
        ),
        trailing: Text(
          schedule,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
//
// String getTimeString() {
// }
