import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Setting/Lists/homeList.dart';
import 'CategtegoriHome_Widget.dart';

Widget Categorie() {
  final ListConstante _listConstante = ListConstante();
  return SizedBox(
    width: double.infinity,
    height: Get.height * 0.3,
    // color: Colors.red,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<ListItem>>(
        future: Future.value(_listConstante.items),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SizedBox.expand(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                    childAspectRatio: 0.75),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _listConstante.items.length,
                itemBuilder: (context, index) {
                  return CardCategorie(snapshot.data![index]);
                },
              ),
            );
          }
        },
      ),
    ),
  );
}
