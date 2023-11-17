import 'package:flutter/material.dart';
import 'package:nota_app/components/buttom_sheet.dart';
import 'package:nota_app/components/custom_appBar.dart';
import 'package:nota_app/components/note_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController titleController = TextEditingController();

  final TextEditingController subtitleController = TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, right: 8),
        child: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              )),
              context: context,
              builder: (context) {
                return CustomButtomSheet(
                  noteFormKey: noteFormKey,
                  titleController: titleController,
                  subtitleController: subtitleController,
                );
              }),
          backgroundColor: Theme.of(context).primaryColorDark,
          child: const Icon(Icons.add),
        ),
      ),
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
