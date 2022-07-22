

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.teal[700],
          title: const Text(
            'WhatsApp UI' ,
            style: TextStyle(
              color: Colors.white ,

            ),
          ),
        actions: [
        IconButton(
            onPressed: (){},
            icon:const Icon(
              Icons.search ,
              color: Colors.white,
            ),
        ),
          IconButton(
            onPressed: (){},
            icon:const Icon(
              Icons.more_horiz ,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.teal[700],
              child: Row(

                children: [
                    IconButton(onPressed: (){},
                        icon:const  Icon(
                          Icons.camera_alt ,
                          color: Colors.white ,
                        ) ,
                    ),
                    const SizedBox(
                      width: 19.0,
                    ),
                    TextButton(
                      onPressed: ()
                      {

                      },
                      child:const Text(
                        'CHATS' ,
                        style: TextStyle(
                          color:Colors.white60,
                          fontWeight: FontWeight.bold ,
                          fontSize:19.0,
                        ),
                      ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    onPressed: ()
                    {

                    },
                    child:const Text(
                      'STATUS' ,
                      style: TextStyle(
                        color:Colors.white60,
                        fontWeight: FontWeight.bold ,
                        fontSize:19.0,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 4.0,
                    backgroundColor: Colors.white38,
                  ),
                  const SizedBox(
                    width: 22.0,
                  ),
                  TextButton(
                    onPressed: ()
                    {

                    },
                    child:const Text(
                      'CALLS' ,
                      style: TextStyle(
                        color:Colors.white60,
                        fontWeight: FontWeight.bold ,
                        fontSize:19.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,item)=>ListMessage() ,
                itemCount: 10 ,
                separatorBuilder: (context,item)=>const SizedBox(
                  height: 5.0,
                ),
            ),
          ],
        ),
      ),
    );
  }
  Widget ListMessage() =>  Row(
  children:[
  const CircleAvatar(
  radius:30.0,
  backgroundImage: NetworkImage(
  'https://userpic.codeforces.org/2181369/title/8059ba66fce5300c.jpg',
  ),
  ),
  Expanded(
  child: Padding(
  padding: const EdgeInsets.all(11.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:   [
  Text(
  ' Mostafa Tarek mohamed  ',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style:TextStyle(
  fontWeight:FontWeight.bold ,
  fontSize: 16.0
  ),
  ),
  SizedBox(
  height: 5.0,
  ),
  Row(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(
              left: 10.0
          ),
          child: Text(
            'Hello in flutter Mr Mostafa!  Hello i faafs',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:TextStyle(
              fontWeight:FontWeight.w200 ,
              //fontSize: 16.0
            ),
          ),

        ),
      ),
      SizedBox(
        width: 45.0,
      ),
      Text(
        '02.12 PM',
        style: TextStyle(
         fontSize: 11.0,
          fontWeight:FontWeight.w200 ,
        ),
      ),
    ],
  ),

  ],
  ),
  ),
  ),
  ],
  );
}

