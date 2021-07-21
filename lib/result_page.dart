import 'package:bmicalculator/constant.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation,required this.bmiResult,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('BMI CALCULATOR'),
    ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: Container(
            child: Text('YOUR RESULT',style: kTitleTextStyle,),

          ),
          ),
          Expanded(flex: 5,
              child: ReusableCard(kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,style: kResultTextStyle,),
                    Text(bmiResult,style: kBMITextStyle,),
                    Text(interpretation,textAlign: TextAlign.center,style: kBodyTextStyle,),

                  ],

                )

          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE',style: kLargeButtonText,),),
              color: kBottomContainerColor,
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      )
    );
  }
}
