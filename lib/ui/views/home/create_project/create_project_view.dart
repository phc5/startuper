import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/home/create_project/create_project_viewmodel.dart';

class CreateProjectView extends StatefulWidget {
  @override
  _CreateProjectViewState createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();

  @override
  Widget build(
    BuildContext context,
  ) {
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<CreateProjectViewModel>.reactive(
          viewModelBuilder: () => CreateProjectViewModel(),
          builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                            Icons.arrow_back,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'New Project',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 24, height: 24),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      focusNode: nameFocus,
                      autofocus: true,
                      controller: nameController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onSubmitted: (text) {
                        nameFocus.unfocus();
                        FocusScope.of(context).requestFocus(descriptionFocus);
                      },
                      textInputAction: TextInputAction.next,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Enter a name',
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        focusNode: descriptionFocus,
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter a short description',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
//                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    width: 100,
                    child: BusyButton(
                      title: 'Submit',
                      onPressed: () {
                        model.addProject(
                          name: nameController.text,
                          description: descriptionController.text,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//child: SingleChildScrollView(
//reverse: true,
//child: Padding(
//padding: EdgeInsets.only(
//bottom: MediaQuery.of(context).viewInsets.bottom),
//child: Column(
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(16.0),
//child: TextField(
//focusNode: contentFocus,
//controller: descriptionController,
//keyboardType: TextInputType.multiline,
//maxLines: null,
////                                onChanged: (value) {
////                                  markContentAsDirty(value);
////                                },
//style: TextStyle(
//fontSize: 18, fontWeight: FontWeight.w500),
//decoration: InputDecoration.collapsed(
//hintText: 'Start typing...',
//hintStyle: TextStyle(
//color: Colors.grey.shade400,
//fontSize: 18,
//fontWeight: FontWeight.w500),
//border: InputBorder.none,
//),
//),
//)
//],
//),
//),
//),
