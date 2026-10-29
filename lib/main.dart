//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ReportPage(),));

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final controller = TextEditingController();
  String? validateTitle(String title){
    if(title.trim().isEmpty){
      return 'Please enter an issue title';
    }
    return null;
  }
  void submitIssue(){
    final error = validateTitle(controller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'Issue Submitted successfully')));
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CampusFix"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Issue Title"),

            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: submitIssue, child: Text("Report Issue"))
          ],
        ),
        ),
    );
  }
}