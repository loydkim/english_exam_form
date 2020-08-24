import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Question extends StatefulWidget {
  @override _Question createState() => _Question();
}

class _Question extends State<Question> with AutomaticKeepAliveClientMixin<Question>{

  @override
  bool get wantKeepAlive => true;

  int wordCount = 0;

  final List<List<String>> questionOptionList = [
    <String>["  Apologize wrong information", "  Remind to appointment", "  Appreciate to apply","  Change appointment"],
    <String>["  Surgery", "  Treatment", "  Cancel","  Sign"],
    <String>["  Doesn\'n have treatment result", "  Has been surgey", "  Taking medicines", "  Treated from other doctor"],
    <String>["  Read HIPAA information", "  Take cash or debit card", "  Bring photo ID", "  Appointment documents"],
    <String>["  Go office with someone", "  Arrive exactly appointment time", "  Change doctor", "  Take HIPAA identification."],
    <String>["  Make appointment again", "  Signature document", "  Treatment in hospital", "  Send medical record"],
    <String>["  I must change the appointment", "  I don't have cash ", "  I should cancel meeting ", "  I have to back home "],
    <String>[" moved ", " hospitalized", " traveled ", " studied "],
    <String>["  I anticipate", "  I finish ", "  I participate ", "  I doubt "],
    <String>[" Thus ", " In addition, ", " Therefore ", " However"],
    <String>["  I appreciate your generosity. ", "  I request take action against.", "  I look forward to see you", "  Thanks for your support"],
  ];

  List<String> answerStringList = List<String>.generate(11,(string) => '  -> Select Your Answer');

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final Color examColor = Colors.indigo[900];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.error,color: examColor,size: 22,),
                          width: 30,height: 30,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top:4.0),
                            child: Text(
                              'Choose the best option according to the information given in the message.',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: examColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0,left:8.0),
                    child: Container(
                      width: size.width,
                      child: Card(
                        elevation:4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _taskOneQuestionTitle('1. This mail is'),
                              _taskOneQuestionBox(0,size.width),

                              _taskOneQuestionTitle('2. Jame\'s appointment for'),
                              _taskOneQuestionBox(1,size.width),

                              _taskOneQuestionTitle('3. The office needs medical record if he'),
                              _taskOneQuestionBox(2,size.width),

                              _taskOneQuestionTitle('4. If Jame is noninsured, he has to'),
                              _taskOneQuestionBox(3,size.width),

                              _taskOneQuestionTitle('5. Jame has to'),
                              _taskOneQuestionBox(4,size.width),

                              _taskOneQuestionTitle('6. After appointment, What will Jame do next'),
                              _taskOneQuestionBox(5,size.width),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.error,color: examColor,size: 22,),
                          width: 30,height: 30,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top:4.0),
                            child: Text(
                              'Here is a response to the message. Complete the response by filling in the blanks.',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: examColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0,left:8.0),
                    child: Container(
                      width: size.width,
                      child: Card(
                        elevation:4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: ' I am writing to let you know that unfortunately,', style: TextStyle(fontSize: 18)),
                                _textSpanWithShowMenu(6,size),
                                TextSpan(text: ' My mother has been ',style: TextStyle(fontSize: 18)),
                                _textSpanWithShowMenu(7,size),
                                TextSpan(text: ' for heart surgery and it is important that I be with her at this time.\n\n',style: TextStyle(fontSize: 18)),
                                _textSpanWithShowMenu(8,size),
                                TextSpan(text: ' that I will be in Boston for the next one months.\n\n I am much looking forward to meeting with you,',style: TextStyle(fontSize: 18)),
                                _textSpanWithShowMenu(9,size),
                                TextSpan(text: ' and would like to find a mutually agreeable time when we can hold a rescheduled meeting.\n\n I apologize for needing to reschedule our appointment and for any inconvenience that this change might create.\n\n',style: TextStyle(fontSize: 18)),
                                _textSpanWithShowMenu(10,size),
                                TextSpan(text: '\n\n Sincerely,',style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan _textSpanWithShowMenu(int index,Size size){
    return TextSpan(
      text: answerStringList[index] == '  -> Select Your Answer' ? '${index+1}. -> Select Your Answer' : '${answerStringList[index]}',
      style: TextStyle(fontSize: 18,color: Colors.red[900],fontWeight: FontWeight.bold),
      recognizer: new TapGestureRecognizer()..onTapDown = (TapDownDetails details) {
        _showPopupMenu(index,details.globalPosition,size);
      },
    );
  }

  void _showPopupMenu(int index,Offset offset,Size size) async {
    double left = offset.dx;
    double top = offset.dy;
    String selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items:
      questionOptionList[index].map((String popupRoute) {
        return new PopupMenuItem<String>(
          child: new Text(popupRoute,
              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red[900])
          ),
          value: popupRoute,
        );
      }).toList(),
      elevation: 8.0,
    );

    if (selected != null) {
      setState(() {
        print(selected);
        answerStringList[index] = selected;
      });
    }
  }


  Widget _taskOneQuestionTitle(String questionString){
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Text(questionString,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
    );
  }

  Widget _taskOneQuestionBox(int index,double widthValue){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: widthValue,
          child: DropdownButton<String>(
            elevation: 4,
            hint: Text(answerStringList[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red[900]),),
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red[900]),
            onChanged: (String newValue) {
              setState(() {
                answerStringList[index] = newValue;
                List<String> textfieldStringList = newValue.split("");
                wordCount = textfieldStringList.length;
                print('word count is ${textfieldStringList.length}');
              });
            },
            isExpanded: true,
            itemHeight: wordCount > 36 ? 80 : 50,
            items: questionOptionList[index].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0,left:8.0),
                  child: SizedBox(
                      width: widthValue-40,
                      child: Text(value,textAlign: TextAlign.start,)
                  ),
                ),
              );
            }).toList(),
          ),
          decoration: new BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            ),
          )
      ),
    );
  }
}
