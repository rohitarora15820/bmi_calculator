import 'package:bmicalculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'result_page.dart';

enum Gender { male, female, defaults }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.defaults;
  int height=180;
  int weight=60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                          selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          IconContent(FontAwesomeIcons.mars, 'MALE')),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                          selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          IconContent(FontAwesomeIcons.venus, 'FEMALE')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text('cm',style: kLabelTextStyle,)
                        ],
                      ),
                      Slider(value: height.toDouble(), min:120.0,max: 220.0,activeColor: Color(0xFFEB1555)
                          ,inactiveColor: Color(0xFF8D8E98),onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                          })
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(kActiveCardColor,
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',style: kLabelTextStyle,),
                            Text(weight.toString(),style: kLabelTextStyle,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                                    onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                    }),
                                SizedBox(width: 10.0,),
                                FloatingActionButton(backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(kActiveCardColor,
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: kLabelTextStyle,),
                          Text(age.toString(),style: kLabelTextStyle,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )) );
              },
              child: Container(
                child: Center(child: Text('CALCULATE',style: kLargeButtonText,),),
                color: kBottomContainerColor,
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}


//class RoundIconButton extends StatelessWidget {
  //RoundIconButton(this.icon, this.onPress);
  //final IconData icon;
  //final Function onPress;
  //@override
  //Widget build(BuildContext context) {
    //return RawMaterialButton(
      //child: Icon(icon),
      //onPressed :(){

      //},
      //shape: CircleBorder(),
      //fillColor: Color(0xFF414F5E),
      //constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      //elevation: 60.0,

    //);
  //}
//}
