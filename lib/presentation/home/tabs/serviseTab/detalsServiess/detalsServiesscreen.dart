import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../data/dataStatec.dart';

class detailsScreen extends StatelessWidget {
  const detailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as DataStatic;

    final Uri _url = Uri.parse('https://flutter.dev');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.details,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Container(
                      width: double.infinity,
                      height: 250.h,
                      child: Image(
                        image: AssetImage(data.image),
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchUrl();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(300, 80),
                      backgroundColor: const Color(0xFF0024FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.requestService,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
