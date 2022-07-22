// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/lay%20out/bolc/state.dart';
//
// import 'bolc/bloc.dart';
//
// class CounterScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=>CounterCubit(),
//       child: BlocConsumer<CounterCubit,CounterState>(
//         listener:(context,state) {
//           if(state is CounterMinusState) print(state.count) ;
//           if(state is CounterPlusState) print(state.count) ;
//         },
//         builder: (context,state) {
//           return  Scaffold(
//             appBar:AppBar(
//               title: const Text(
//                 'Count',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900 ,
//                   color: Colors.black ,
//                 ),
//               ),
//             ),
//             body: Center(
//               child: Row(
//                 mainAxisAlignment:MainAxisAlignment.center,
//                 children:[
//                   Container(
//                     decoration:BoxDecoration(
//                       color: Colors.blue ,
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: TextButton(
//                       onPressed: ()
//                       {
//                         CounterCubit.get(context).plus() ;
//                       },
//                       child: const Text(
//                         'BLUS',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900 ,
//                           fontSize: 30.0 ,
//                           color: Colors.black ,
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Container(
//                       child: CircleAvatar(
//                         radius: 35.0,
//                         child:  Text (
//                           '${CounterCubit.get(context).count}',
//                           style: const TextStyle(
//                             fontSize:40.0 ,
//                             fontWeight: FontWeight.w900 ,
//                             color: Colors.black ,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration:BoxDecoration(
//                       color: Colors.blue ,
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: TextButton(
//                       onPressed: ()
//                       {
//                         CounterCubit.get(context).minus() ;
//                       },
//                       child:  Text(
//                         'MUNIS',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900 ,
//                           fontSize: 30.0 ,
//                           color: Colors.black ,
//                         ),
//                       ),
//
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
