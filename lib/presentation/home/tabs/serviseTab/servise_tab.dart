import 'package:flutter/material.dart';
import 'package:mostafa/data/dataStatec.dart';
import 'package:mostafa/presentation/home/tabs/serviseTab/serviesWidgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiseTab extends StatelessWidget {
  const ServiseTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<DataStatic> dataStatic = DataStatic.generateDataStatic(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.service),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  serviceCard(dataStatic: dataStatic[index]),
              itemCount: dataStatic.length,
            ),
          ),
        ],
      ),
    );
  }
}
