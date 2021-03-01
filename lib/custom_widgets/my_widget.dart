import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:play/constants/constants.dart';
class ProIndicator extends StatefulWidget {
  static const String id='pro_indicator';
  double value_dx;
  ProIndicator({@required this.value_dx});
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
    final Size size=MediaQuery.of(context).size;
    return Container(
        height:size.width*0.09,
        width:size.width,
        margin: EdgeInsets.symmetric(vertical: 23),
        padding:EdgeInsets.symmetric(horizontal: 20),
        child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: iColor,
              border:Border.all(width:3,color: lColor),
              boxShadow: [
                BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
                BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
                BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
              ],
            ),
            child: Visibility(
              visible:true,
              child:Slider(
                value: dx_width,
                min:0.0,
                max:200.0,
                activeColor: lColor,
                inactiveColor: iColor,
                onChanged: (value){
                  print(value);
                  setState(()=>dx_width=widget.value_dx);},
              ),
            )
        ),
    );
  }
}
