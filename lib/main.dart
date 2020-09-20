import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int temp = 0;
  int time = 0;
  int currentFunction = 18;
  int nxstate = 0;
  bool isLocked = false;
  bool isPlaying = false;
  bool LBisOn = false;
  bool flagthree = false;

  void getTemp() {
    if (nxstate == 1 || nxstate == 2 || nxstate == 3) {
      if (currentFunction == 0) {
        temp = 110;
        time = 15;
      } else if (currentFunction == 1) {
        temp = 160;
        time = 20;
      } else if (currentFunction == 2) {
        temp = 200;
        time = 15;
      } else if (currentFunction == 3) {
        temp = 210;
        time = 45;
      } else if (currentFunction == 4) {
        temp = 110;
        time = 15;
      } else if (currentFunction == 5) {
        temp = 190;
        time = 35;
      } else if (currentFunction == 6) {
        temp = 180;
        time = 15;
      } else if (currentFunction == 7) {
        temp = 110;
        time = 15;
      } else if (currentFunction == 8) {
        temp = 114;
        time = 14;
      } else if (currentFunction == 9) {
        temp = 110;
        time = 15;
      } else if (currentFunction == 10) {
        temp = 189;
        time = 60;
      } else if (currentFunction == 11) {
        temp = 110;
        time = 15;
      } else if (currentFunction == 12) {
        temp = 510;
        time = 13;
      } else if (currentFunction == 13) {
        temp = 60;
        time = 5;
      } else if (currentFunction == 14) {
        temp = 210;
        time = 15;
      } else if (currentFunction == 15) {
        temp = 300;
        time = 25;
      } else if (currentFunction == 16) {
        temp = 160;
        time = 15;
      } else if (currentFunction == 17) {
        temp = 210;
        time = 5;
      } else {
        temp = 0;
        time = 0;
      }
    } else {}
  }

  Color getPanelColor() {
    if (nxstate == 0) {
      return Colors.black87;
    } else {
      return Colors.lightBlueAccent;
    }
  }

  Color getTextColor() {
    if (nxstate == 0) {
      return Colors.grey;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 20,
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(20),
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.width) / 3.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 30,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 48,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (nxstate == 0) {
                                currentFunction = 18;
                                nxstate = 1;
                              } else {
                                nxstate = 0;
                                currentFunction = 18;
                                temp = 0;
                                time = 0;
                              }
                            });
                          },
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 48,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isLocked && !isPlaying) {
                                if (nxstate == 1 || nxstate == 3) {
                                  currentFunction = 0;
                                  getTemp();
                                  nxstate = 2;
                                } else {}
                              }
                            });
                          },
                          child: Icon(
                            Icons.crop_din,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 48,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isLocked && !isPlaying) {
                                if (nxstate == 1 || nxstate == 2) {
                                  currentFunction = 6;
                                  getTemp();
                                  nxstate = 3;
                                } else {}
                              }
                            });
                          },
                          child: Icon(
                            Icons.menu_book,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 48,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (isLocked) {
                                isLocked = false;
                              } else {
                                isLocked = true;
                              }
                            });
                          },
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 48,
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(
                                    color: getTextColor(),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20),
                              ),
                              Text(
                                "°C",
                                style: TextStyle(
                                    color: getTextColor(),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 70),
                              ),
                              Text(
                                "$time",
                                style: TextStyle(
                                    color: getTextColor(),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20),
                              ),
                              Text(
                                "min",
                                style: TextStyle(
                                    color: getTextColor(),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 70),
                              ),
                              Icon(
                                Icons.lock,
                                color: isLocked ? Colors.white : Colors.black,
                                size: MediaQuery.of(context).size.width / 60,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star,
                                  color: currentFunction == 0
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 1
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 2
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 3
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 4
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 5
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star,
                                  color: currentFunction == 6
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 7
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 8
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 9
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 10
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 11
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star,
                                  color: currentFunction == 12
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 13
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 14
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 15
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 16
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                              Icon(Icons.star,
                                  color: currentFunction == 17
                                      ? Colors.lightBlueAccent
                                      : Colors.black),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: getPanelColor(),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10))),
                      width: (MediaQuery.of(context).size.width) / 3.75,
                      height: (MediaQuery.of(context).size.width) / 7.14,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isPlaying && !isLocked) {
                                if (nxstate == 2 || nxstate == 3) {
                                  if (currentFunction == 18) {
                                    currentFunction = 0;
                                    getTemp();
                                  }
                                  if (nxstate == 2) {
                                    if (currentFunction <= 4) {
                                      currentFunction++;
                                      getTemp();
                                    } else {
                                      currentFunction = 0;
                                      getTemp();
                                    }
                                  }
                                  if (currentFunction == 18) {
                                    currentFunction = 6;
                                    getTemp();
                                  }
                                  if (nxstate == 3) {
                                    if (currentFunction <= 16) {
                                      currentFunction++;
                                      getTemp();
                                    } else {
                                      currentFunction = 6;
                                      getTemp();
                                    }
                                  }
                                } else if (nxstate == 4) {
                                  temp++;
                                  getTemp();
                                } else if (nxstate == 5) {
                                  time++;
                                  getTemp();
                                } else {}
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (!isPlaying && !isLocked) {
                              if (nxstate == 2) {
                                flagthree = false;
                                nxstate = 4;
                              } else if (nxstate == 3) {
                                flagthree = true;
                                nxstate = 4;
                              } else if (nxstate == 4) {
                                nxstate = 5;
                              } else if (nxstate == 5) {
                                if (flagthree) {
                                  nxstate = 3;
                                } else {
                                  nxstate = 2;
                                }
                              } else {}
                            }
                          },
                          child: Icon(
                            Icons.crop_16_9,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isLocked && !isPlaying) {
                                if (nxstate == 2 || nxstate == 3) {
                                  if (currentFunction == 18) {
                                    currentFunction = 0;
                                    getTemp();
                                  }
                                  if (nxstate == 2) {
                                    if (currentFunction > 0) {
                                      currentFunction--;
                                      getTemp();
                                    } else {
                                      currentFunction = 5;
                                      getTemp();
                                    }
                                  }

                                  if (currentFunction == 18) {
                                    currentFunction = 5;
                                    getTemp();
                                  }
                                  if (nxstate == 3) {
                                    if (currentFunction >= 7) {
                                      currentFunction--;
                                      getTemp();
                                    } else {
                                      currentFunction = 17;
                                      getTemp();
                                    }
                                  }
                                } else if (nxstate == 4) {
                                  temp--;
                                  getTemp();
                                } else if (nxstate == 5) {
                                  time--;
                                  getTemp();
                                } else {}
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isLocked) {
                                if (nxstate != 0) {
                                  if (LBisOn) {
                                    LBisOn = false;
                                  } else {
                                    LBisOn = true;
                                  }
                                }
                              }
                            });
                          },
                          child: Icon(
                            Icons.wb_incandescent_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              if (!isLocked) {
                                if (nxstate != 0 && nxstate != 1) {
                                  if (isPlaying) {
                                    isPlaying = false;
                                  } else {
                                    isPlaying = true;
                                  }
                                }
                              }
                            });
                          },
                          child: Icon(
                            Icons.not_started_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 65,
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.crop_din,
                        color: isPlaying
                            ? Colors.lightGreenAccent
                            : Colors.black26,
                        size: MediaQuery.of(context).size.width / 15,
                      ),
                      Text(
                        "$temp" + "°C  " + "$time" + "min",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 60,
                          color: isPlaying
                              ? Colors.lightGreenAccent
                              : Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                  Icon(
                    Icons.lightbulb_outline,
                    color: LBisOn ? Colors.lightGreenAccent : Colors.black26,
                    size: MediaQuery.of(context).size.width / 15,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
