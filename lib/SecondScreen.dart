import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double Reslut ;
  final String Kind ;
  final int Age;
  SecondScreen({
    required this.Kind ,
    required this.Reslut,
    required this.Age ,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(
           'BMI Result',
         ),
         leading: IconButton(
           onPressed: (){
             Navigator.pop(context);
           },
           icon: Icon(
             Icons.arrow_back_rounded,
           ),
         ),
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : $Kind' ,
              style: TextStyle(
                fontWeight:FontWeight.bold ,
                fontSize: 20.0 ,

              ),
            ),
            Text(
              'Result :${Reslut.round()}' ,
              style: TextStyle(
                fontWeight:FontWeight.bold ,
                fontSize: 20.0 ,

              ),
            ),
            Text(
              'Age :$Age' ,
              style: TextStyle(
                fontWeight:FontWeight.bold ,
                fontSize: 20.0 ,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
