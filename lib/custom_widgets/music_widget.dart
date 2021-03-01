import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play/constants/constants.dart';
import 'package:play/models/music_model.dart';
class MusicWidget extends StatelessWidget {
  Music music;
  MusicWidget({this.music});
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Container(
      height: size.width*0.18,
      width: size.width,
      margin: EdgeInsets.only(top:25,left:20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _nextPrevious(context,icon: Icons.play_arrow),
          SizedBox(width: size.width*0.05,),
          _titleSection(context,icon: Icons.add),
        ],
      ),
    );
  }
  Widget _nextPrevious(BuildContext context,{icon,isPrevious}){
    final Size size=MediaQuery.of(context).size;
    return AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 100),
          height: size.width*0.2,
          width: size.width*0.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1,-1),
              colors: [
                iColor.withOpacity(1),
                iColor.withOpacity(0.9),
                bgColor,
                Colors.white.withOpacity(0.9),
              ],
            ),
            shape: BoxShape.circle,
            color: iColor,
            border:Border(top: BorderSide(width:3,color: lColor),bottom:BorderSide(width: 3,color: lColor),left: BorderSide(width: 3,color: lColor),right: BorderSide(width: 3,color:lColor)),
            boxShadow: [
              BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
              BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
              BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
            ],
          ),
          child: Center(
            child:Icon(icon,size:size.width*0.08,),
          ),
    );
  }
  Widget _titleSection(BuildContext context,{icon,isPrevious}){
    final Size size=MediaQuery.of(context).size;
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 100),
      height: size.width*0.2,
      width: size.width*0.6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1,-1),
          colors: [
            iColor.withOpacity(1),
            iColor.withOpacity(0.9),
            bgColor,
            Colors.white.withOpacity(0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(size.width*0.2/2),
        color: iColor,
        border:Border(top: BorderSide(width:3,color: lColor),bottom:BorderSide(width: 3,color: lColor),left: BorderSide(width: 3,color: lColor),right: BorderSide(width: 3,color:lColor)),
        boxShadow: [
          BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
          BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
          BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
        ],
      ),
      child:Center(
        child:ListTile(
          isThreeLine: false,
          contentPadding: EdgeInsets.symmetric(horizontal:15,vertical:0),
          title: Text(this.music.artist,style: TextStyle(fontSize: size.width*0.04,color: lColor,fontWeight: FontWeight.bold),),
          subtitle: Text(this.music.title,style:  TextStyle(fontSize: size.width*0.035,color: lColor,fontWeight: FontWeight.w600),),
          trailing: IconButton(
            icon: Icon(Icons.pending_rounded,color: lColor,),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
