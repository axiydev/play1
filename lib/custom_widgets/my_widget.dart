import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:play/constants/constants.dart';
class ProIndicator extends StatefulWidget {
  static const String id='pro_indicator';
  @override
  _ProIndicatorState createState() => _ProIndicatorState();
}
class _ProIndicatorState extends State<ProIndicator> {
  double dx_width;
  @override
  void initState(){
    super.initState();
    dx_width=0.0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: 30,
          width: double.infinity,
          padding:EdgeInsets.symmetric(horizontal: 20),
          child:Container(
            color: Colors.red,
            child: Visibility(
              visible:true,
              child: Slider(
                value: dx_width,
                min:0.0,
                max:200.0,
                activeColor: lColor,
                inactiveColor: iColor,
                onChanged: (value){
                  print(value);
                  setState(()=>dx_width=value);},
              ),
            )
          ),
        ),
      ),
    );
  }
}
