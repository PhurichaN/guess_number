import 'package:flutter/material.dart';
import 'package:guess_number/game1.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

//--------------------------------------------------//
class _GamePageState extends State<GamePage> {
  //เก็บตัวอักษรไว้จากผู้พิม มาจากหน้าtext fild
  //TextEditingController คือช่องว่าง
  final _controller = TextEditingController();
  final _game = Game();

  // state variable
  var _ans = '';
  var _feedbackText = ''; //เก็บข้อความไปแสดงผลที่จอเเว็ป
  var _showTestButton = false; //เก็บค่าแสดงไอคอนปุ่มtest

//------------------------
  void handleClickGuess() {
    setState(() {
      _showTestButton = !_showTestButton;
    });

    print('Button click');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      // แจ้ง error
      print('Input error');
      setState(() {
        //call method build again!
        _feedbackText = 'Input error, please try again';
      });
    } else {
      var result = _game.doGuess(guess);
      var A = _game.reAns();
      setState(() {
        _ans = 'The answer is $A';
      });
      if (result == Result.tooHigh) {
        // ทายมากไป
        print('Too high');
        setState(() {
          _feedbackText = '$guess Too high, please try again';
        });
      } else if (result == Result.tooLow) {
        // ทายน้อยไป
        print('Too low');
        setState(() {
          _feedbackText = '$guess Too low, please try again';
        });
      } else {
        // ทายถูก
        print('Correct');
        setState(() {
          _feedbackText = '$guess Good job!';
        });
      }
    }
  }

//---------------ตัวที่แสดงหน้าเว็ป------------------
  @override
  Widget build(BuildContext context) {
    //ตัวจัดรูปแบบทั่วไป
    return Scaffold(
      //แทบข้อเรื่องเว็ป
      appBar: AppBar(
        title: const Text('Guess the Number'),
      ),
      //การแสดงผลทั้งหมดอยู่ภายใตคำสั่ง Center เซตค่ากึ่งกลาง
      body: Center(
        //childเก็บwidgetได้ตัวเดียว ตั้งค่าว่าจะจัดเป็นแนวไหน col>ตั้ง row>นอน
        child: Column(
          //จัดระเบียบระหว่างบรรทัด
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //children เก็บ widget ได้ทีละหลายๆตัวได้
          children: [
            const Text('Please enter number between 1 and 100'),
            //ช่องที่ให้ผู้ใช้พิม
            TextField(
              //controller: TextEditingController(),
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            // Callback function
            //ปุ่มกด
            ElevatedButton(
              //ชื่อเมธอดที่จะส่งค่าไป
              onPressed: handleClickGuess,
              child: const Text('GUESS'),
            ),

            Text(_ans),
            Text(_feedbackText),

            //ปุ่มกด
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: _showTestButton ? Colors.black : Colors.pink,
              ),
              onPressed: (){},
              child: const Text('TEST'),
            ),
            Icon(_showTestButton ? Icons.print :Icons.access_time),
          ],
        ),
      ),
    );
  }
}
