import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:play/constants/constants.dart';
import 'dart:math' as M;
class HomePage extends StatefulWidget {
  static const String id='home_page';
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin{
  Animation _animation;
  AnimationController _controller;
  bool isPlaying=false;
  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds:5));
    _animation=Tween(begin: 0.0,end:2*M.pi).animate(_controller,);
    _animation.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _controller.repeat();
      }
    });
    _controller.forward();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: bgColor,
        elevation: 0.0,
        leading:Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 40,
            width: 40,
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
                borderRadius: BorderRadius.circular(10),
                color: iColor,
                border:Border(top: BorderSide(width:1,color: Colors.grey),bottom:BorderSide(width: 1,color: Colors.grey),left: BorderSide(width: 1,color: Colors.grey),right: BorderSide(width: 1,color: Colors.grey)),
                boxShadow: [
                  BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
                  BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(3,6),blurRadius:6),
                  BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(3,6),blurRadius:6),
                ],
            ),
            child: Center(
              child: IconButton(
                icon:Icon(Icons.arrow_back,size: 20,),
                color: Colors.black,
                onPressed: (){},
              ),
            ),
          )
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
              child: Container(
                height: 40,
                width: 40,
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
                  borderRadius: BorderRadius.circular(10),
                  color: iColor,
                  border:Border(top: BorderSide(width:1,color: Colors.grey),bottom:BorderSide(width: 1,color: Colors.grey),left: BorderSide(width: 1,color: Colors.grey),right: BorderSide(width: 1,color: Colors.grey)),
                  boxShadow: [
                    BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
                    BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(3,6),blurRadius:6),
                    BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(3,6),blurRadius:6),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    icon:Icon(Icons.menu,size: 20,),
                    color: Colors.black,
                    onPressed: (){},
                  ),
                ),
              )
          ),
        ],
        title: Text('Player'),
        centerTitle: true,
      ),
      body:SafeArea(
        child:  Container(
          width: double.infinity,
          height: size.height,
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.width*0.5,
                  width: size.width*0.5,
                  margin: EdgeInsets.only(top: 20),
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
                    border:Border(top: BorderSide(width:5,color: lColor),bottom:BorderSide(width: 5,color: lColor),left: BorderSide(width: 5,color: lColor),right: BorderSide(width: 5,color:lColor)),
                    boxShadow: [
                      BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
                      BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
                      BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
                    ],
                  ),
                  child:AnimatedBuilder(
                    animation: _animation,
                    builder: (context,wid){
                      return Transform(
                          alignment: Alignment.center,
                          transform:Matrix4.rotationZ(_animation.value),
                          child:Center(
                            child:Icon(Icons.music_note_rounded,size: size.width*0.2,),
                          ),
                      );
                    },
                  )
                ),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child:Row(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                   children: [
                     _nextPrevious(context,icon: Icons.skip_previous),
                     isPlaying?_isplay(context):GestureDetector(
                       onTap:()=>setState(()=>isPlaying=true),
                       child: AnimatedContainer(
                         height: size.width*0.25,
                         width: size.width*0.25,
                         margin: EdgeInsets.only(top: 22),
                         curve: Curves.easeIn,
                         duration:Duration(milliseconds: 100),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: iColor,
                           border:Border(top: BorderSide(width:3,color: lColor),bottom:BorderSide(width: 3,color: lColor),left: BorderSide(width: 3,color: lColor),right: BorderSide(width:3,color:lColor)),
                           boxShadow: [
                             BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
                             BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
                             BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
                           ],
                         ),
                         child: Center(
                           child:Icon(Icons.stop,size: size.width*0.13,),
                         ),
                       ),
                     ),
                     _nextPrevious(context,icon:Icons.skip_next),
                   ],
                 ),
               ),
              ],
            ),
        ),
      )
    );
  }
  Widget _isplay(BuildContext context){
    final Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap:()=>setState(()=>isPlaying=false),
      child: AnimatedContainer(
        height: size.width*0.25,
        width: size.width*0.25,
        margin: EdgeInsets.only(top: 22),
        curve: Curves.easeIn,
        duration: Duration(milliseconds:100),
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
          border:Border(top: BorderSide(width:3,color: lColor),bottom:BorderSide(width: 3,color: lColor),left: BorderSide(width: 3,color: lColor),right: BorderSide(width:3,color:lColor)),
          boxShadow: [
            BoxShadow(color: Colors.white,spreadRadius:0,offset: Offset(-4,-4),blurRadius:5),
            BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:10),
            BoxShadow(color: Colors.grey[700],spreadRadius: 0,offset: Offset(5,10),blurRadius:15),
          ],
        ),
        child: Center(
          child:Icon(Icons.play_arrow,size: size.width*0.13,),
        ),
      ),
    );
  }
  Widget _nextPrevious(BuildContext context,{icon,}){
    final Size size=MediaQuery.of(context).size;
    return Transform.translate(
      offset:Offset(0,-size.width*0.17),
      child:GestureDetector(
        onTap:(){},
        child:AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 100),
          height: size.width*0.2,
          width: size.width*0.2,
          margin: EdgeInsets.only(top: 20),
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
        ),
      ),
    );
  }
}
