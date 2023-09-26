import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  Future<List<Category>> fetchCategories() async {
    Uri url =
        Uri.https("run.mocky.io", "v3/6f0cc8e3-1e9f-4c00-8452-af1eda920146");
    debugPrint("Anfrage wird gesendet...");
    http.Response response = await http.get(url);
    debugPrint(response.body);
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse.runtimeType == List) {
      return (jsonResponse as List)
          .map((val) => Category.fromJson(val))
          .toList();
    } else {
      return [Category.fromJson(jsonResponse)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGreyDark,
      body: Padding(
        padding: kPaddingLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(
              text: "Kategorien",
            ),
            FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Category> categoryList = snapshot.data ?? [];
                    debugPrint(categoryList.toString());
                    return Expanded(
                      child: ListView(
                        children: categoryList
                            .map(
                              (val) => Padding(
                                padding: kPaddingVerLarge,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width - 40,
                                  color: kColorSecondary,
                                  child: Center(
                                    child: Text(
                                      val.name,
                                      style: kTextHeadline2,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }
                  return const Text(
                    "Lädt",
                    style: kTextBody,
                  );
                }),
            PrimaryButton(
              text: "Weiter",
              onPressed: () {
                debugPrint("Weiter");
              },
            )
          ],
        ),
      ),
    );
  }
}
