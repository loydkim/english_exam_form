import 'dart:async';

import 'package:englishexamtest/article.dart';
import 'package:englishexamtest/question.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  int currentTime = 0;
  int taskTime = 540;
  StreamSubscription<CountdownTimer> sub;

  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(vsync: this, length: 2);
    setState(() {
      currentTime = taskTime;
      _startCountDown();
    });
    super.initState();
  }

  void _startCountDown(){
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: taskTime),
      new Duration(seconds: 1),
    );

    sub = countDownTimer.listen(null);
    sub.onData((data){
      if(mounted){
        setState(() {
          currentTime--;
        });
      }
    });

    sub.onDone(() {
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Reading Test',style: TextStyle(fontSize: 14.0,),
            ),
            Visibility(
              visible: true,
              child: Text(
                'Answer the Email',
                style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text('${formatHHMMSS(currentTime)}',style: TextStyle(fontSize: 15,color: currentTime <11 ? Colors.red : Colors.black)),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(right:20.0,left:20),
              child: ColoredTabBar(Colors.white,
                TabBar(
                  controller: tabController,
                  indicatorColor: Colors.black87,
                  tabs: [
                    Tab(child: _tabTitle(0,'Article',Icons.assignment,Colors.indigo[900],size)),
                    Tab(child: _tabTitle(1,'Question',Icons.spellcheck,Colors.green[900],size)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Article(),
                  Question()
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _tabTitle(int index,String tabTitle,IconData tabIcon,Color tabColor,Size size){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          tabIcon,
          size: tabController.index == index ? 24:20,
          color: tabController.index == index ? tabColor:Colors.grey[700],
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0,left:8.0),
          child: Text(
            tabTitle,
            style: TextStyle(
                fontSize: tabController.index == index ? size.width*0.05 : size.width*0.04,
                fontWeight: tabController.index == index ? FontWeight.bold : FontWeight.normal,
                color: tabController.index == index ?tabColor:Colors.grey[700]),),
        ),
      ],
    );
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      if(minutes == 0){
        return "${secondsStr}s";
      }else {
        return "${minutesStr}m${secondsStr}s";
      }
    }
    return "$hoursStr:$minutesStr:$secondsStr";
  }

}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: tabBar,
  );
}

