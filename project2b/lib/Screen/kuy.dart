import 'package:flutter/material.dart';

void main() => runApp(Kuyscreen());

class Kuyscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FirstAidGuide(),
        ),
      ),
    );
  }
}

class FirstAidGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      'How to First Aid',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Broken Arm and Leg',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                      'แขนขาหัก',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            buildStep(
              '1. หากมีบาดแผลควรห้ามเลือดและปิดบาดแผลด้วยอุปกรณ์ที่สะอาด',
              'assets/images/1.1.jpg',
            ),
            buildStep(
              '2. ประคบน้ำแข็งเพื่อลดอาการปวดและบวม',
              'assets/images/1.2.jpg',
            ),
            buildStep(
              '3. ใช้ผ้าสะอาดแขนพยุงกระดูกแขนหรือไม้อะไหล่ หรือใช้ไม้แผ่นไปกระดูกหน้าแข้งข้อพับหรือใช้กระดูกต้นขา',
              'assets/images/1.3.jpg',
            ),
            buildStep(
              '4. หลีกเลี่ยงการนวดในบริเวณที่ได้รับบาดเจ็บเพราะอาจทำให้กระดูกเคลื่อนได้',
              'assets/images/1.4.jpg',
            ),
            buildStep(
              '5. หลีกเลี่ยงการกินอาหารหรือดื่มเครื่องดื่มต่างๆ',
              'assets/images/1.5.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStep(String text, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red.shade900, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180, // Adjust the width as needed
                height: 120, // Adjust the height as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade900, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
