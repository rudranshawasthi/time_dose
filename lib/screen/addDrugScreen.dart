import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_dose/models/Drug.dart';
import 'package:time_dose/models/drugData.dart';

class AddDrugScreen extends StatefulWidget {
  @override
  _AddDrugScreenState createState() => _AddDrugScreenState();
}

class _AddDrugScreenState extends State<AddDrugScreen> {
  Drug newDrug = Drug();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfF15274a),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF183588),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'New Med',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              style: TextStyle(fontSize: 25, color: Colors.white),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val) {
                newDrug.name = val;
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                'Morning',
                style: TextStyle(color: Colors.grey[200], fontSize: 15),
              ),
              Checkbox(
                value: newDrug.morning,
                onChanged: (val) {
                  setState(() {
                    newDrug.toggleMorning();
                  });
                },
                activeColor: Color(0xFFeb06ff),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'After Noon',
                style: TextStyle(color: Colors.grey[200], fontSize: 15),
              ),
              Checkbox(
                value: newDrug.afternoon,
                onChanged: (val) {
                  setState(() {
                    newDrug.toggleAfternoon();
                  });
                },
                activeColor: Color(0xFFeb06ff),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                'Evening',
                style: TextStyle(color: Colors.grey[200], fontSize: 15),
              ),
              Checkbox(
                value: newDrug.evening,
                onChanged: (val) {
                  setState(() {
                    newDrug.toggleEvening();
                  });
                },
                activeColor: Color(0xFFeb06ff),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Night',
                style: TextStyle(color: Colors.grey[200], fontSize: 15),
              ),
              Checkbox(
                value: newDrug.night,
                onChanged: (val) {
                  setState(() {
                    newDrug.toggleNight();
                  });
                },
                activeColor: Color(0xFFeb06ff),
              ),
            ]),
            FlatButton(
              onPressed: () {
                Provider.of<DrugData>(context, listen: false).addDrug(newDrug);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Color(0xFFeb06ff),
              padding: EdgeInsets.all(5),
            )
          ],
        ),
      ),
    );
  }
}
