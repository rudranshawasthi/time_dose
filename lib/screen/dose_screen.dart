import 'package:flutter/material.dart';
import 'package:time_dose/screen/addDrugScreen.dart';
import 'package:time_dose/widgets/drugListWidget.dart';

class DoseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3450A1),
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text('Hey there!?'),
      ),
      backgroundColor: Color(0xFF3450A1),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Getting Well !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: DrugList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFeb06ff),
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddDrugScreen());
        },
      ),
    );
  }
}
