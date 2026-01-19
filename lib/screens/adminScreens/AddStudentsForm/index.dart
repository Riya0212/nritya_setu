import 'package:flutter/material.dart';
import 'package:nritya_setu/components/form_utils.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/index.dart';
import 'package:nritya_setu/constants/utils.dart';

class AddStudentsForm extends StatefulWidget {
  const AddStudentsForm({super.key});

  @override
  State<AddStudentsForm> createState() => _AddStudentsFormState();
}

class _AddStudentsFormState extends State<AddStudentsForm> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController parentsContactController =
      TextEditingController();

  Widget buildStudentsForm() {
    final colors = Theme.of(context).colors;

    return Form(
      child: Column(
        children: [
          buildTextField(
            hint: 'Enter firstname',
            context: context,
            controller: firstnameController,
            title: 'Firstname :',
            isRequired: true,
            validator: (value) {
              if (value == '' || value == null) {
                return 'This field is required';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            validationLabel: 'name',
          ),

          SizedBox(height: Metrics.height(context) * 0.01),

          buildTextField(
            hint: 'Enter middlename',
            context: context,
            controller: middlenameController,
            title: 'Middlename :',
            keyboardType: TextInputType.text,
            validationLabel: 'name',
          ),
          SizedBox(height: Metrics.height(context) * 0.01),

          buildTextField(
            hint: 'Enter lastname',
            context: context,
            controller: lastnameController,
            title: 'Lastname :',
            isRequired: true,
            validator: (value) {
              if (value == '' || value == null) {
                return 'This field is required';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            validationLabel: 'name',
          ),

          SizedBox(height: Metrics.height(context) * 0.01),

          Row(
            children: [
              Expanded(
                child: buildTextField(
                  hint: 'Enter contact',
                  context: context,
                  controller: contactController,
                  title: 'Contact :',
                  isRequired: true,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  validationLabel: 'name',
                ),
              ),
              SizedBox(width: Metrics.width(context) * 0.02),
              Expanded(
                child: buildTextField(
                  hint: 'Enter contact',
                  context: context,
                  controller: parentsContactController,
                  title: "Parent's Contact :",
                  keyboardType: TextInputType.number,
                  validationLabel: 'name',
                ),
              ),
            ],
          ),

          GenericDropdown<String>(
            title: 'Exam University :',
            titleTextStyle: TextStyle(
              color: colors.colorBlack,
              fontWeight: FontWeight.w600,
              fontSize: Metrics.getFontSize(context, 15),
            ),
            items: [],
            selectedItem: null,
            hintText: 'Select university',
            onChanged: (value) {
              setState(() {
                if (value != null) {}
              });
            },
            itemToString: (value) {
              return value.toString();
            },
          ),
          GenericDropdown<String>(
            title: 'Exam Level :',
            titleTextStyle: TextStyle(
              color: colors.colorBlack,
              fontWeight: FontWeight.w600,
              fontSize: Metrics.getFontSize(context, 15),
            ),
            items: [],
            selectedItem: null,
            hintText: 'Select exam level',
            onChanged: (value) {
              setState(() {
                if (value != null) {}
              });
            },
            itemToString: (value) {
              return value.toString();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
 
      backgroundColor: colors.colorWhite,
      appBar: buildCustomAppBar(context, 'Add Student Details'),
      body: Container(
        color: Color.fromRGBO(94, 22, 33, 0.1),
        padding: EdgeInsets.all(Metrics.width(context) * 0.03),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(child: buildStudentsForm()),
                ),
                SafeArea(
                  child: buildBtn(
                    context: context,
                    title: 'SUBMIT',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
