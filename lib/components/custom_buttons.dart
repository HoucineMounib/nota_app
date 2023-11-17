import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, this.onTap, required this.currentPagr});

  final void Function()? onTap;
  final currentPagr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 55),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Text(
              currentPagr == 2 ? "Let's Go !" : 'Next',
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 48,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Next',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: Theme.of(context).canvasColor,
                )
              ]))),
    );
  }
}
