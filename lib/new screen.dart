import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        title:Text(
          'Flutter Weather' ,
          style: TextStyle(
            color: Colors.amber ,
          ),
        ),
        actions: [
         IconButton(
             onPressed: ()
             {

             },
             icon: Icon(
               Icons.settings ,
               color: Colors.amber,
             ),
         ),
          IconButton(
            onPressed: ()
            {},
            icon: Icon(
              Icons.search,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body:Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EGYPT',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20.0 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
            SizedBox(
              height:5.0,
            ),
            Text(
              'Updated: 6:17pm',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20.0 ,
                fontWeight: FontWeight.w300 ,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.wb_sunny ,
                        color: Colors.amber,
                        size:50.0 ,
                      ) ,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  const Text(
                    '-2' ,
                    style: TextStyle(
                      color: Colors.amber ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 30.0 ,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
