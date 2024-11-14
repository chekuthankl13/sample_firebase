import 'package:flutter/material.dart';
import 'package:sample_firebase/core/utils/utils.dart';

Padding txtfield({cntr,txt,ic,isPsw = false,obsure, suffix}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: cntr,
        obscureText: isPsw?obsure:false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                     ic,
                      color: Colors.grey[300],
                    ),
                    suffix: isPsw?suffix:null,
                    hintText: txt,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
    );
  }

   ElevatedButton btn(BuildContext context,{required Widget child,onpressed}) {
    return ElevatedButton(
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                fixedSize: Size(sW(context) / 2, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),),),
            child: child,
          );
  }