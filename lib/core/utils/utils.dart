import 'package:flutter/material.dart';

sW(context)=> MediaQuery.of(context).size.width;
sH(context)=> MediaQuery.of(context).size.height;

spaceHeight(val)=>SizedBox(height: double.parse(val.toString()),);
spaceWidth(val)=>SizedBox(width: double.parse(val.toString()),);

errorToast(context,{msg})=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

error(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 50,
        ),
        spaceHeight(10),
        Text(error)
      ],
    ),
  );
}


loading({clr = Colors.black})=> Center(child: CircularProgressIndicator(
  strokeWidth: .5,
  strokeAlign: 10,
  color: clr,),);





GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

