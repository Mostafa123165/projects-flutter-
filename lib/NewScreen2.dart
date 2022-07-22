
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ResScreen.dart';

class BMIScreen extends StatefulWidget {
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
 bool Ismale = true ;
 double heigh =100.0;
 int weight =60;
 int age =28;
 @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Center(
           child: Text(
             'BMI CALCULATOR',
             style: TextStyle(
               fontSize:18.0 ,
             ),
           ),
         ),
         elevation: 0.0,
       ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children:[
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                       setState(() {
                         Ismale=true ;
                       });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:Ismale?Colors.blue:Colors.grey[400],
                          borderRadius: BorderRadius.circular(7.0),
                        ) ,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Container(
                             height: 80.0,
                             width: 80.0,
                             decoration:   BoxDecoration(
                                image:const DecorationImage(
                                 image:AssetImage(
                                   'assert/images/male.jpg',
                                 ),
                               ),
                               shape: BoxShape.circle
                             ),
                           ),
                            const SizedBox(
                              height: 5.0,
                            ),
                          const  Text(
                              'MALE' ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          Ismale=false ;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:!Ismale?Colors.blue:Colors.grey[400],
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:80.0 ,
                              width: 80.0,
                              decoration: const BoxDecoration(
                                image:DecorationImage(
                                  image:AssetImage(
                                   'assert/images/female11.png'
                                  ),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                           const Text(
                              'FEMALE' ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.grey[400] ,
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT' ,
                      style: TextStyle(
                        fontSize:20.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:[
                        Text(
                          '${heigh.round()}' ,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                        ),
                        const Text(
                          'CM' ,
                          style: TextStyle(
                            fontSize:10.0,
                          ),
                        ),

                      ],
                    ),
                    Slider(
                        value:heigh,
                        max: 300,
                        min: 50,
                        onChanged:(value){
                          setState(() {
                            heigh=value ;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                          color: Colors.grey[400] ,
                          borderRadius: BorderRadius.circular(7.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text(
                            'WIGHT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 35.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    weight++ ;
                                  });
                                },
                                child:const Icon(
                                  Icons.add ,
                                ),
                                mini: true,
                                heroTag: 'float1',
                              ),
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    weight-- ;
                                  });
                                },
                                child:const Icon(
                                  Icons.remove ,
                                ),
                                mini: true,
                                heroTag: 'float1',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width:20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                          color: Colors.grey[400] ,
                          borderRadius: BorderRadius.circular(7.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 35.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child:const Icon(
                                  Icons.add ,
                                ),
                                mini: true,
                                heroTag:'float3',
                              ),
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                                heroTag:'float2',

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
           width:double.infinity,
            color: Colors.blue,
            child: TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>result(
                          age:age,
                          heigh: heigh,
                          weidth: weight,
                        ),
                    ),
                  );
                },
                child: const Text(
                  'CAlCULATE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
