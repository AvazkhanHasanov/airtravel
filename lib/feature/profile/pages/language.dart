import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/language_tile.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedLang = "O’zbek (Uz)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Language",
        centerTitle: false,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tavsiya etilgan", style: AppStyles.h5Bold),
            15.height,
            LanguageTile(
              title: "O’zbek (Uz)",
              isSelected: selectedLang == "O’zbek (Uz)",
              onTap: () => setState(() => selectedLang = "O’zbek (Uz)"),
            ),
            LanguageTile(
              title: "Yзбек (Yз)",
              isSelected: selectedLang == "Ўзбек (Ўз)",
              onTap: () => setState(() => selectedLang = "Ўзбек (Ўз)"),
            ),
            LanguageTile(
              title: "Русский (Ру)",
              isSelected: selectedLang == "Русский (Ру)",
              onTap: () => setState(() => selectedLang = "Русский (Ру)"),
            ),
          ],
        ),
      ),
    );
  }
}
