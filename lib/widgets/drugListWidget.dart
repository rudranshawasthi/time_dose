import 'package:flutter/material.dart';
import 'package:time_dose/models/drugData.dart';
import 'package:time_dose/widgets/drugTile.dart';
import 'package:provider/provider.dart';

class DrugList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrugData>(
      builder: (BuildContext context, drugData, Widget child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final drug = drugData.drugList[index];
            return DrugTile(
              name: drug.name,
              schedule: drug.getScheduleString(),
              deleteCall: () {
                drugData.deleteDrug(drug);
              },
            );
          },
          itemCount: drugData.drugCount(),
        );
      },
    );
  }
}
