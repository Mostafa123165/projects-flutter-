
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/SecondScreen.dart';
import 'package:untitled/shared/components/components.dart';

class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true ;
  double heigh = 100.0 ;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator' ,
          style: TextStyle(
            color:Colors.white ,

          ),
        ),
      ),
      body:Container(
        child: Column(
         children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Row(
                 children:[
                   Expanded(
                     child: GestureDetector(
                       onTap:(){
                         setState(() {
                           isMale=true ;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(7.0) ,
                           color:isMale?Colors.blue: Colors.grey[400] ,
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             Container(
                               height: 80.0,
                               width: 80.0,
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: AssetImage(
                                       'assert/images/male.jpg'
                                   ),
                                 ),
                                 shape: BoxShape.circle,
                               ),
                             ) ,
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
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
                     width: 15.0,
                   ),
                   Expanded(
                     child: GestureDetector(
                       onTap:(){
                         setState(() {
                           isMale=false ;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(7.0) ,
                           color:!isMale?Colors.blue: Colors.grey[400] ,
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             Container(
                               height: 80.0,
                               width: 90.0,
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: AssetImage(
                                       'assert/images/female11.png'),
                                 ),
                                 shape: BoxShape.circle,
                               ),
                             ) ,
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                               'FMALE' ,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0 ,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0) ,
                    color: Colors.grey[400] ,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 20.0,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment:MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${heigh.round()}' ,
                            style: const TextStyle(
                              fontSize: 30.0 ,
                              fontWeight:FontWeight.w900 ,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            'CM',
                            style:TextStyle(
                              fontWeight: FontWeight.bold ,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value:heigh,
                          max: 300,
                          min: 50,
                          onChanged:(value)
                          {
                            setState(() {
                              heigh =value;
                              print(heigh.round());
                            });
                          } ,
                      ),
                    ],
                  ),
                ),
              ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(15.5),
               child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0) ,
                          color: Colors.grey[400] ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 20.0,
                              ),
                            ),
                             Text(
                              '$weight' ,
                              style: TextStyle(
                                fontSize: 30.0 ,
                                fontWeight:FontWeight.w900 ,
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
                                  } ,
                                  child:  Icon(
                                    Icons.add ,
                                  ),
                                  mini:true,
                                ),
                                FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      weight++ ;
                                    });
                                  } ,
                                  child:  Icon(
                                    Icons.add ,
                                  ),
                                  mini:true,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 13.0 ,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0) ,
                          color: Colors.grey[400] ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                           const Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              '$age' ,
                              style: TextStyle(
                                fontSize: 30.0 ,
                                fontWeight:FontWeight.w900 ,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      age++ ;
                                    });
                                  } ,
                                  child: const Icon(
                                    Icons.add ,
                                  ),
                                  mini:true,
                                ),
                                FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      age-- ;
                                    });
                                  } ,
                                  child: const Icon(
                                    Icons.remove ,
                                  ),
                                  mini: true,
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
             width: double.infinity,
             height: 40.0,
             child: MaterialButton(
               color: Colors.blue,
                 onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder:(context)=>SecondScreen(
                               Age: age ,
                               Kind:isMale?'Male':'Fmale',
                               Reslut: heigh,
                         ),
                     ),
                 );
                 } ,
               child:const Text(
                 'CALCULATOR' ,
                 style: TextStyle(
                   color: Colors.white ,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
