import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
 }
 class FormScreenState extends State<FormScreen>{

  int numberOfOffs = 0;
  String reason = '';
  String value = '';

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  // Widget _buildOffsField() {
  //   return null;
  // }
  Widget _buildReason(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Reason for off"),
      validator: (value){
        if(value == null){
        return 'Reason is required!';
        }
        },
      onSaved: (value) {
        reason = value!;
      },
    );
 }



   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(title: Text("Add Offs")),
       body: Container(
         margin: EdgeInsets.all(24),
         child: Form(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             //_buildOffsField(),
             _buildReason(),
             SizedBox(height: 100),
             RaisedButton(onPressed: ()=> {} ,
             child: Text("Submit",style:TextStyle(color: Colors.blueAccent, fontSize: 16))
               ,)
           ],
         )),
       ),
     );
   }
 }
