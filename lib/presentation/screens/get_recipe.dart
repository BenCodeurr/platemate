import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:platemate/config/themes/theme.dart';

List<String> countries = [
  'Italian',
  'Congolese',
  'Mexican',
  'Chinese',
  'Japanese',
  'Lebanese',
];

class GetRecipeView extends StatefulWidget {
  const GetRecipeView({super.key});

  @override
  State<GetRecipeView> createState() => _GetRecipeViewState();
}

class _GetRecipeViewState extends State<GetRecipeView> {
  String dropdownValue = countries.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Recipe",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: GestureDetector(
          onTap: () => context.go('/'),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("I have these ingredients"),
            const SizedBox(height: 20.0),
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[100],
              ),
              child: const Center(
                child: Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.black54,
                  size: 60.0,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text("I want to eat"),
            DropdownMenu<String>(
              // width: MediaQuery.of(context).size.width,
              initialSelection: countries.first,
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  countries.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 30.0),
            const Text("I also have"),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[100],
                  border: Border.all(width: 0.4)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text("Description (Optional)"),
            const SizedBox(height: 10.0),
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[100],
                  border: Border.all(width: 0.4)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kPrimaryColor,
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.transparent,
                ),
                child: const Text(
                  'Get Recipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
