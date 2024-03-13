import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(
      {super.key,
      required this.txt,
      required this.fontColor,
      required this.buttonColor,
      required this.jenisButton,
      required this.onTap});

  final String txt, jenisButton;
  final Color fontColor, buttonColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: jenisButton == 'outline'
          ? OutlinedButton.icon(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: fontColor,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: Text(
                txt,
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    foregroundColor: fontColor,
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
    );
  }
}
