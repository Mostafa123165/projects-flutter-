import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/lay%20out/news_app/cubit/Cubit.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/modules/wep_view/web_view_Screen.dart';
import 'package:untitled/shared/bloc/bloc.dart';
import 'package:untitled/shared/components/constant.dart';

Widget defaultTextFormField({
   required String lapel,
   required TextInputType type,
   required IconData prefix ,
   bool Ispassword=false ,
   IconData? suffix,
   GestureTapCallback? onTap ,
  TextEditingController? controler ,
  FormFieldValidator? validator ,
})
=>
    TextFormField(
  obscureText: Ispassword,
  keyboardType: type,
  validator:validator,
  decoration:InputDecoration(
    labelText:lapel,
    border:OutlineInputBorder() ,
    prefixIcon:Icon(
        prefix ,
    ) ,
    suffixIcon: suffix!=null ? Icon(
        suffix
    ):null  ,
    ),
  onChanged:(value)
  {
    print(value);
  },
  onFieldSubmitted: (value)
  {
    print(value) ;
  },
  onTap:onTap ,
  controller: controler,
) ;
Widget defaultbutton({
  required String text,
  required VoidCallback function ,
})
=>  Container(
  width: double.infinity,
  height: 50.0,
  color: Colors.blue,
  child: MaterialButton(
    onPressed: function,
    child: const Text(
      'LOGIN',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white ,
      ),
    ),
  ),
);
Widget buildTasksItem(Map map,context)
=>  Row(
  children:[
    Expanded(
      child: CircleAvatar(
        radius: 40.0,
        child:Text(
          map['Time'],
        ),
      ),
    ),
    const SizedBox(
      width: 20.0,
    ),
    Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            map['Title'],
          ),
          Text(
            map['Date'],
          ),
        ],
      ),
    ),
    const SizedBox(
      width: 20.0,
    ),
    IconButton(
        onPressed:()
        {
          AppTodoBloc.get(context).UpdateDatebase(state: 'done', id:map['id'],);
        },
        icon: const Icon(
          Icons.check_box,
          color: Colors.blue,
        ) ,
    ),
    IconButton(
        onPressed:()
        {
          AppTodoBloc.get(context).UpdateDatebase(state: 'archived', id: map['id'] ,);
        },
        icon: const Icon(
          Icons.archive,
          color: Colors.grey,
        ) ,
    ),
  ],
);
Widget bildItemBusiness(dynamic mp,context) =>
    InkWell(
      onTap: (){
        navigator(context, WebViweScreen(mp['url']),);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${mp['urlToImage']}'
                  ),
                  fit:BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${mp['title']}',
                        style:Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      '${mp['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText2
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget BuildAllScreen (dynamic list,context ,{ isSearch= false})=> ConditionalBuilder(
  condition: list.length >0,
  builder:(context) => ListView.separated(
      physics: BouncingScrollPhysics()  ,
      itemBuilder: (context,index)=>bildItemBusiness(list[index],context),
      separatorBuilder: (context,state)=>const SizedBox(
        height: 5.0,
      ),
      itemCount: 10
  ),
  fallback:(context)=>isSearch?Container():Center(child: CircularProgressIndicator()) ,
);
  void navigator (BuildContext context,widget) =>Navigator.push(
    context,
    MaterialPageRoute(
      builder:(context)=>widget,
    )
);
