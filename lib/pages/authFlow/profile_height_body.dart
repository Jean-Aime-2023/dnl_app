import "package:dnl_ui/components/radio_tile.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

enum Physical {
  petite, curvy, athletic, average, preferNotToSay
}

class ProfilePhysical extends StatefulWidget {
  const ProfilePhysical({super.key});

  @override
  State<ProfilePhysical> createState() => _ProfilePhysicalState();
}

class _ProfilePhysicalState extends State<ProfilePhysical> {
  final List<String> physicalLabels = ["Petite", "Curvy", "Athletic", "Average", "Prefer not to say"];

  Physical physical = Physical.petite;

  bool visibleOnProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/height.svg"),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Height and body type?",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 510,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 260,
                        child: CupertinoPicker(
                            itemExtent: 64,
                            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                              background: Colors.transparent,
                            ),
                            onSelectedItemChanged: (value) {},
                            scrollController: FixedExtentScrollController(
                                initialItem: 1
                            ),
                            children: [
                              ...List.generate(20, (index) => const Padding(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  "5' 8'' (68 inch)",
                                  style: TextStyle(
                                      color: Color(0xffACADAF),
                                      fontSize: 28
                                  ),
                                ),
                              ),)
                            ]
                        ),
                      ),

                      Column(
                        children: [
                          ...List.generate(
                            physicalLabels.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: RadioTile(
                                    title: physicalLabels[index],
                                    radioValue: Physical.values[index],
                                  ),
                                ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Checkbox(
                    value: visibleOnProfile,
                    onChanged: (value) {
                      setState(() {
                        visibleOnProfile = value!;
                      });
                    },
                    activeColor: const Color(0xffE94057),
                  ),

                  const SizedBox(width: 10,),

                  const Text(
                    "Visible on my profile",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
