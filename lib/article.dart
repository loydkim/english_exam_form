import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  @override _Article createState() => _Article();
}

class _Article extends State<Article> with AutomaticKeepAliveClientMixin<Article>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color examColor = Colors.indigo[900];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: size.width,
        child: Card(
            elevation:4.0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.error,color: examColor,size: 22,),
                        Text(' Read the following message.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: examColor),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(" Dear Patient:\n\n This letter is to confirm your appointment for James at CELPIP TIP hospital. Please plan to arrive approximately 30 minutes prior to your scheduled appointment to allow time for you and your significant other to sign consent forms that are required for your treatment. It is important that your significant other is able to accompany you to your appointments as much as possible. With the type of care we provide, we may be unable to schedule/perform certain procedures without their signature.\n\n If you have been seen by another physician, please request that your medical records be forwarded to our office prior to your appointment, as well. In an effort to be HIPAA compliant and to protect your private health information and identity, we require that you bring your photo I.D. and insurance card to your first visit.\n\n As a courtesy to you we will submit your insurance claims for you; however, any co- payments will be collected at the time of service. For any non insured patients, fees for all office visits and related charges are payable at the time of service.\n\n My staff and I appreciate your selecting our office for your health care.\n\n Sincerely,\nD.K William",style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
