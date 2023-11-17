import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              blurRadius: 16,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Reference site gut Lorem Ipsum, giving information on  giving information on its origins, as well as a random Lipsum generator',
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColorDark.withOpacity(0.7)),
          )
        ],
      ),
    );
  }
}
