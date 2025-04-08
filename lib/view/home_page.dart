import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  String? valueOfDrops;
  Widget widget = Container(color: Colors.red, width: 50, height: 50);
  double valueOfSlider = 37;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu<String>(
              onSelected: (value) {
                print(value);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(value: 'Option 1', label: "Setting"),

                DropdownMenuEntry<String>(value: 'Option 2', label: "Profile"),
              ],
            ),
            StatefulBuilder(
              builder: (context, setstate) {
                return DropdownButton(
                  value: valueOfDrops,
                  items: [
                    DropdownMenuItem(child: Text("Setting"), value: 'Option 2'),
                    DropdownMenuItem(child: Text("Profile"), value: 'Option 1'),
                  ],
                  onChanged: (value) {
                    valueOfDrops = value;
                    setstate(() {});
                  },
                );
              },
            ),
            PopupMenuButton(
              onSelected: (value) {
                value();
              },
              itemBuilder:
                  (context) => List.generate(
                    3,
                    (index) => PopupMenuItem(
                      value: () {
                        print(index);
                      },
                      child: Text(index.toString()),
                    ),
                  ),
            ),
            // ! https://www.youtube.com/watch?v=c6BPtrU0M7I&t=363s&pp=ygUTc3VwZXJfZHJhZ19hbmRfZHJvcA%3D%3D
            Draggable(
              child: Container(color: Colors.green, width: 100, height: 100),
              feedback: Container(
                color: Colors.greenAccent,
                width: 100,
                height: 100,
              ),
            ),
            StatefulBuilder(
              builder: (context, setstate) {
                return DragTarget(
                  onMove: (data) {
                    widget = Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    );
                    setstate(() {});
                  },
                  builder: (context, candidateData, rejectedData) {
                    return widget;
                  },
                );
              },
            ),
            StatefulBuilder(
              builder: (context, setstate) {
                return Slider(
                  year2023: true,
                  label: valueOfSlider.toString(),
                  // secondaryTrackValue: valueOfSlider,

                  // allowedInteraction: SliderI,
                  // divisions: 1,
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: 100,
                  value: valueOfSlider,
                  onChanged: (value) {
                    valueOfSlider = value;
                    setstate(() {});
                  },
                );
              },
            ),
            StatefulBuilder(
              builder: (context, setstate) {
                return InkWell(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);
                    if (result != null) {
                      file = File(result.files.single.path!);
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("There is an error")),
                        );
                      }
                    }
                    setstate(() {});
                  },
                  child: Container(
                    width: 200,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child:
                          file == null
                              ? Text("Pick Your File")
                              : InteractiveViewer(child: Image.file(file!)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
