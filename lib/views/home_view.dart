import 'package:flutter/material.dart';
import 'package:nota_app/components/custom_appBar.dart';
import 'package:nota_app/components/note_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notes',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Theme.of(context).primaryColorDark),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 16.0, // spacing between rows
                      crossAxisSpacing: 24.0, // spacing between columns
                      mainAxisExtent: 250),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return NoteCard();
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
