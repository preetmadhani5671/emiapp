import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: emiapp(),
    ),
  );
}

class emiapp extends StatefulWidget {
  const emiapp({Key? key}) : super(key: key);

  @override
  State<emiapp> createState() => _emiappState();
}

class _emiappState extends State<emiapp> {
  double Amount = 0, Rate = 10, Year = 1;
  dynamic result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: Text(
          "EMI",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.account_circle),
        actions: [
          Icon(Icons.access_alarms_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 300,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Total Amount = ${result + Amount.toInt()}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total Intrest = ${result.toInt()}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Emi Per Month= ${result ~/ 12.toInt()}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80))),
            ),
            Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueGrey.shade700, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${Amount.toInt()}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                      max: 100000,
                      divisions: 10,
                      activeColor: Colors.blueGrey.shade700,
                      inactiveColor: Colors.blueGrey.shade100,
                      value: Amount,
                      onChanged: (value) {
                        setState(() {
                          Amount = value;
                        });
                        answer();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueGrey.shade700, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${Rate.toInt()}%",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                      max: 20,
                      value: Rate,
                      divisions: 20,
                      activeColor: Colors.blueGrey.shade700,
                      inactiveColor: Colors.blueGrey.shade100,
                      onChanged: (value) {
                        setState(() {
                          Rate = value;
                        });
                        answer();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueGrey.shade700, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${Year.toInt()}/Y",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                      max: 30,
                      value: Year,
                      activeColor: Colors.blueGrey.shade700,
                      inactiveColor: Colors.blueGrey.shade100,
                      onChanged: (value) {
                        setState(() {
                          Year = value;
                        });
                        answer();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void answer() {
    result = (Amount * Rate * Year) / 100;
  }
}
