import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mess.dart';

class communications extends StatefulWidget {
  const communications(
      {Key? key,
      required this.username,
      required this.title1,
      required this.kala1,
      required this.school,
      required this.klass,
      required this.tr})
      : super(key: key); //klass
  final List title1;
  final String klass;
  final String school;
  final bool kala1;
  final String tr;
  final String username;

  @override
  State<communications> createState() => _communicationsState();
}

class _communicationsState extends State<communications> {
  var info3;
  var lama;
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.tr}',
    };
    final info2 = await http.get(Uri.parse('https://afleet.co.ke/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    var info = jsonDecode(utf8.decode(info2.bodyBytes)); //returns info
    //info3
    setState(() {
      info3 = info;
    });

    //}

    ;
  }

  String xnm = '';

  @override
  void initState() {
    super.initState();
    inmat();
    xnm = widget.klass.toString().replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context) {
    //inmat();
    //rint(title1);
    return info3 == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: widget.kala1 ? Colors.grey.shade900 : Colors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Text(title1.toString()),
                  Card(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: Column(children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          tileColor: widget.kala1
                              ? Colors.blueGrey.shade900
                              : Colors.grey.shade100,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FriendMess(
                                  title: xnm.toString(),
                                  token: widget.tr,
                                  myname: '',
                                  user: widget.username.toString(),
                                ),
                              ), //MaterialPageRoute
                            );
                          },
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        10.0) //                 <--- border radius here
                                    )),
                            child: Icon(Icons.chat_bubble_outline),
                          ),
                          title: Text(
                            "Class Teacher",
                            style: TextStyle(
                              color: !widget.kala1
                                  ? Colors.blueGrey.shade900
                                  : Colors.white,
                            ),
                          ),
                          subtitle: Text("Message"),
                          trailing: InkWell(
                            child: Stack(children: [
                              RotatedBox(
                                quarterTurns: 90,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.deepPurple,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: -2,
                                  right: -1,
                                  child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor:
                                          Colors.transparent, //white,
                                      child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor:
                                            Colors.transparent, //red,
                                        child:
                                            null /*Center(
                                                  child: Text(
                                                      int.parse(crpt
                                                                  .toString()) >
                                                              5
                                                          ? ''
                                                          : crpt,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.white)))*/
                                        ,
                                      )))
                            ]),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FriendMess(
                                    title: 'Class Teacher',
                                    token: widget.tr,
                                    myname: '',
                                    user: widget.username.toString(),
                                  ),
                                ), //MaterialPageRoute
                              );
                            },
                          ),
                        ),
                      ])),

                  /*
                      
                                        u['title'].contains('message') && 
                                                u['whoiswho'] ==
                                                    widget.user.toString()
                                            ? u['writer'] ==
                                                        widget.user
                                                            .toString() &&
                                                    u['to'] ==
                                                        widget.title.toString() 
                                                
                      */ /*&&ry['title']=='message' &&ry['to'].split(',')[0].toString() !=
                                  widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '') &&
                         
                          ry['to'].split(',')[0].toString() != "all"&&
                          ry['title'].toString()=='Fees'
                          //////////////////////////
                            ry['to']
                              .split(',')[0]
                              .toString()
                              .replaceAll('[', '')
                              .toString() == xnm.toString() 
                      &&
                          */
                  ...info3.toList().reversed.map((ry) => 
                         ry['whoiswho'].toString() == 'notification'&&  ry['to']
                              .split(',')[0]
                              .toString()
                              .replaceAll('[', '').replaceAll(' ', '')
                              .toString() == xnm.toString() 
                      
                          ? Card(
                              color: widget.kala1
                                  ? Colors.blueGrey.shade900.withOpacity(0.2)
                                  : Colors.grey.shade100,
                              elevation: 0.1,
                              child: Column(children: [
                                //he im rn
                                //Text( ry['whoiswho'].toString()),
                                ListTile(
                                    //tileColor: widget.kala1?Colors.blueGrey.shade900:Colors.white,
                                    leading: Icon(
                                      Icons.person_outlined,
                                      color: Colors.deepPurple,
                                    ),
                                    title: Text(ry['writer'].toString(),
                                        style: TextStyle(
                                          color: widget.kala1
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                    subtitle: Text(
                                      ry['date'].split('|')[0].toString() +
                                          " at " +
                                          ry['date'].split('|')[1].toString(),
                                      style: TextStyle(
                                        color: widget.kala1
                                            ? Colors.grey[300]
                                            : Colors.grey[500],
                                      ),
                                    ),
                                    trailing:
                                        Icon(Icons.notifications_outlined)),
                                ListTile(
                                  //leading:Icon(Icons.person_outlined,color: Colors.deepPurple,),
                                  subtitle: Center(
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            //alignment: Alignment.topRight,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                            ),

                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              color: widget.kala1
                                                  ? Colors.blueGrey.shade900
                                                  : Colors.white,
                                              border: Border.all(
                                                color: widget.kala1
                                                    ? Colors.blueGrey.shade900
                                                    : Colors.white,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: widget.kala1
                                                      ? Colors.blueGrey.shade900
                                                      : Colors.white,
                                                  spreadRadius: 1,
                                                  blurRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Card(
                                              elevation: 0.0,
                                              color: widget.kala1
                                                  ? Colors.blueGrey.shade900
                                                      .withOpacity(0.2)
                                                  : Colors.white,
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.end,

                                                children: [
                                                  Text(
                                                    ry['mation'],
                                                    //textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: !widget.kala1
                                                          ? Colors
                                                              .blueGrey.shade900
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  //ListTile()
                                                ],
                                              ),
                                            ),
                                          ))),
                                  title: Row(children: [
                                    Chip(
                                        label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                          Text(ry['title'].toString())
                                        ]))
                                  ]),
                                  //trailing: Icon(Icons.notifications_outlined)
                                ),
                                Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                ),
                              ]))
                          
                      : Container(
                          //xnm.toString()
                         // child: Text(xnm +
                           //   ('1 blue' == '$xnm')
                            //      .toString()) //'1 blue'==ry['to'].split(',')[0].toString().replaceAll('[', '').toString()).toString()),
                          //child:  Text(Type(ry['to'].split(',')[0].toString().replaceAll('[', '').toString().replaceAll(' ', ''), [widget.klass.toString().replaceAll(',', '').replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '')]) .toString()+" "+ry['to'].split(',')[0].toString().replaceAll('[', '').toString()+ " "+widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '').toString()),

                          ))
                ],
              ),
            ));
  }
}
