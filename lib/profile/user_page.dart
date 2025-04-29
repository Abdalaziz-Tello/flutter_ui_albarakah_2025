import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:profile_solutaion/model/user_model.dart';


class ProfileCard extends StatefulWidget {
  final User user;

  const ProfileCard({ required this.user});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _expanded = false;
  late TextEditingController name; 
  File? image; 
@override
  void initState() {
    name= TextEditingController(text:widget.user.email );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GestureDetector(
        onTap: () => setState(() => _expanded = !_expanded),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: ()async {
              FilePickerResult? result =    await FilePicker.platform.pickFiles();
                  setState(() {
                    if (result!.files.first.path !=null) {
                      image=File(result.files.first.path!);
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:image==null ? NetworkImage(widget.user.picture) :FileImage(image!),
                ),
              ),
              SizedBox(height: 10),
              Text(widget.user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: _expanded
                    ? Column(
                        children: [
                          SizedBox(height: 10),
                          Text(widget.user.email, style: TextStyle(color: Colors.grey[700])),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 400,
                            child: TextField(
                              enabled: false,
                              controller: name,
                            ),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 400,
                            child: TextField(
                              enabled: false,
                              controller: name,
                            ),
                          ),
                        )
      
                        ],
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
