import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> menuItems;
  final String label;

  CustomDropDown({required this.label, required this.menuItems, Key? key})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: Border.all(color: Colors.red),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            const Icon(
              Icons.category,
              size: 23,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  dropdownColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  underline: const SizedBox(),
                  hint: Text(widget.label, style: const TextStyle(color: Colors.white)),
                  items: widget.menuItems.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e, style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
