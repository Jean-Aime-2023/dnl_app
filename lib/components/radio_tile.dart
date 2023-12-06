import "package:flutter/material.dart";

import "../pages/authFlow/profile_height_body.dart";


class RadioTile extends StatefulWidget {
  const RadioTile({super.key, required this.title, required this.radioValue});

  final String title;
  final Physical radioValue;


  @override
  State<RadioTile> createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  late Physical physical;

  @override
  void initState() {
    physical = Physical.petite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch(widget.title){
            case "Petite":
              physical = Physical.petite;
              break;

            case "Curvy":
              physical = Physical.curvy;
              break;

            case "Athletic":
              physical = Physical.athletic;
              break;

            case "Average":
              physical = Physical.average;
              break;

            case "Prefer not to say":
              physical = Physical.preferNotToSay;
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffDDDDDD),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
            ),
            Radio(
              value: widget.radioValue,
              groupValue: physical,
              activeColor: const Color(0xffE94057),
              onChanged: (value) {
                setState(() {
                  physical = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
