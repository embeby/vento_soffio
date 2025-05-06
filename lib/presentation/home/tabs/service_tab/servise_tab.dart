import 'package:flutter/material.dart';
import 'package:mostafa/data/data_states.dart';
import 'package:mostafa/presentation/home/tabs/service_tab/service_widgets.dart';

import '../../../../l10n/app_localizations.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({super.key});

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
                  ServiceCard(dataStatic: dataStatic[index]),
              itemCount: dataStatic.length,
            ),
          ),
        ],
      ),
    );
  }
}
