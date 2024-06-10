import 'package:flutter/material.dart';

void main() {
  runApp(BrokenspearScreen());
}

class BrokenspearScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to first Aid',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 239, 162, 72),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  'Faint \n เป็นลม',
                  textAlign: TextAlign.center, // Set text alignment to center
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/1.1.jpg',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '1.หากมีบาดแผลควรห้ามเลือดและปิดบาดแผลด้วยอุปกรณ์ที่สะอาด',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/1.2.jpg',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '2.ประคบน้ำแข็งเพื่อลดอาการปวดและบวม',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/1.3.jpg',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '3.ใช้ผ้าคล้องแขนพยุงกระดูกแขนหรือไหปลาร้า หรือใช้แผ่นไม้กระดาษหนังสือพิมพ์หรือนิตยสารม้วนจนแข็งมาใช้ดาม กระดูกชั่วคราวแทนเฝือกได้เช่นกัน',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/1.4.jpg',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '4.ห้ามนวดในบริเวณที่ได้รับบาดเจ็บเพราะอาจทำให้อาการกระดูกหักรุนแรงขึ้น',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color.fromARGB(255, 239, 162, 72),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/1.5.jpg',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '5.หลีกเลี่ยงการกินอาหารหรือดื่มเครื่องดื่ม',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
