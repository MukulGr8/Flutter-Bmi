import 'package:flutter/material.dart';

class Bmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi>{
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController= new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String _resultReading="";

  void calculateBmi(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if(_ageController.text.isNotEmpty || age > 0 && _heightController.text.isNotEmpty || inches>0
      && _weightController.text.isNotEmpty || weight>0){
        result = weight / (inches * inches) * 703;
        if(result < 18.5){
          _resultReading = "UnderWeight";
        }
        else if(result >= 18.5 && result < 25){
          _resultReading = "Great Shape";
        }
        else if(result >= 25.0 && result < 30){
          _resultReading = "OverWeight";
        }
        else if(result >= 30.0){
          _resultReading = "Damn . .You Should Die!";
        }
      }else{
        result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint("Icon Tapped")),
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => debugPrint("")),
        ],
      ),

      body: new Container(
        alignment: Alignment.center,
        child:new ListView(
          children: <Widget>[
            new Image.asset('images/bmif.png',height: 85.0,width: 75.0,),

            new Container(
              margin: EdgeInsets.all(3.0),
              height: 270.0,
              width: 290.9,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "e.g: 34 ",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height in feet",
                      hintText: "e.g: 6.5 ",
                      icon: Icon(Icons.insert_chart),
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight in pounds",
                      hintText: "e.g: 180 ",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.90)),

                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(onPressed: calculateBmi,color: Colors.pinkAccent,
                      child: new Text("Calculate"),textColor: Colors.white,),
                  )

                  
                ],
              ),
            ),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("BMI: $result ",style: new TextStyle(fontWeight: FontWeight.w500,
                fontSize: 19.0,fontStyle: FontStyle.italic,color: Colors.blueAccent),),

                new Padding(padding: new EdgeInsets.all(5.0)),
                new Text("$_resultReading",style: new TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 19.0,fontStyle: FontStyle.italic,color: Colors.pinkAccent),)

              ],
            ),
          ],
        )
      ),

      //Floating action button
      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
        backgroundColor: Theme.of(context).primaryColorLight,
        tooltip: "Going Up",
        child: new Icon(Icons.call_missed),),

      //Bottom Navigator
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add),title: new Text("Home")),
        new BottomNavigationBarItem(icon: new Icon(Icons.print),title: new Text("Print")),
        new BottomNavigationBarItem(icon: new Icon(Icons.call_received),title: new Text("Downloads"))
      ],onTap: (int i) => debugPrint("hey touched $i"),),
    );
  }
}