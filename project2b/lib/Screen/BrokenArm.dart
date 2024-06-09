import 'package:flutter/material.dart';

void main() {
  runApp(BrokenArmScreen());
}

class BrokenArmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to first Aid',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 191, 49, 49),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Broken Arm & Leg',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 191, 49, 49)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                border: Border.all(
                  color: Color.fromARGB(
                      255, 191, 49, 49), // Set your desired stroke color here
                  width: 5.0, // Set your desired stroke width here
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                child: Image.asset(
                  'assets/images/1.1.jpg', // Provide your image path here
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '1.หากมีบาดแผลควรห้ามเลือดและปิดบาดแผลด้วยอุปกรณ์ที่สะอาด',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 191, 49, 49),
            // Add a line between the first and second Padding widgets
            thickness: 5.0, // Set the thickness of the line
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                border: Border.all(
                  color: Color.fromARGB(
                      255, 191, 49, 49), // Set your desired stroke color here
                  width: 5.0, // Set your desired stroke width here
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                child: Image.asset(
                  'assets/images/1.2.jpg', // Provide your image path here
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '2.ประคบน้ำแข็งเพื่อลดอาการปวดและบวม',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 191, 49, 49),
            // Add a line between the first and second Padding widgets
            thickness: 5.0, // Set the thickness of the line
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                border: Border.all(
                  color: Color.fromARGB(
                      255, 191, 49, 49), // Set your desired stroke color here
                  width: 5.0, // Set your desired stroke width here
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                child: Image.asset(
                  'assets/images/1.3.jpg', // Provide your image path here
                  width: 200,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '3.ใช้ผ้าคล้องแขนพยุงกระดูกแขนหรือไหปลาร้า หรือใช้แผ่นไม้กระดาษหนังสือพิมพ์หรือนิตยสารม้วนจนแข็งมาใช้ดาม กระดูกชั่วคราวแทนเฝือกได้เช่นกัน',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 191, 49, 49),
            // Add a line between the first and second Padding widgets
            thickness: 5.0,
            // Set the thickness of the line
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                border: Border.all(
                  color: Color.fromARGB(
                      255, 191, 49, 49), // Set your desired stroke color here
                  width: 5.0, // Set your desired stroke width here
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                child: Image.asset(
                  'assets/images/1.4.jpg', // Provide your image path here
                  width: 200,
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
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 191, 49, 49),
            // Add a line between the first and second Padding widgets
            thickness: 5.0, // Set the thickness of the line
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                border: Border.all(
                  color: Color.fromARGB(
                      255, 191, 49, 49), // Set your desired stroke color here
                  width: 5.0, // Set your desired stroke width here
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Make edges round
                child: Image.asset(
                  'assets/images/1.5.jpg', // Provide your image path here
                  width: 200,
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
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 191, 49, 49),
            // Add a line between the first and second Padding widgets
            thickness: 5.0, // Set the thickness of the line
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}