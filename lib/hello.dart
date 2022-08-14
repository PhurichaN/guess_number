import 'dart:io';
import 'package:gast_number/game.dart';
//import 'dart:math';
//UX --> User Experience
void main(){
  stdout.write('Enter a maximum number to random: ');
  var N = stdin.readLineSync();
  var n = int.tryParse(N!);
  var game = Game(maxRandom: n);
  List<int> myList = [];
  //print(myList.length);

  int result = 0; // bool
  int failGuess = 1;
  do{
    if(n == null) {
      stdout.write('Please guess the number between 1 to 100 : '); //ไม่ขึ้นบันทัดใหม่
    }
    else{
      stdout.write('Please guess the number between 1 to $N : ');
    }
    //print('Please guess the number between 1 to 100');
    var input = stdin.readLineSync();  // รับค่าจากคีบอด  readLineSync() เป็น String?
    var guess = int.tryParse(input!); // แปลงสตริงเป็นจำนวนเต็ม ที่ไม่ null เลยใส่ ! ไว้

    if(guess == null){
      print('please enter number only');
      continue;
    }
    result = game.doGuess(guess);
    if(result==0){
      failGuess++;
    }
  }
  while(result != 1);
  myList.add(failGuess);
//------------------------------------------
  int result2 = 0; //ใช้เก็บค่าที่ส่งกลับมาจากคราส
  var time = 0; //ใช้เช็คลูป bool
  do{
    print('Play again?');
    print('เล่นอีกให้พิมพ์ "Y/y" ไม่เล่นต่อพิมพ์ "N/n"');
    var choose = stdin.readLineSync(); //รับค่าจากผู้ใช้ว่าจะเล่นต่อหรือไม่
    if(choose == 'y'|| choose == 'Y'){ //
      stdout.write('Enter a maximum number to random: ');
      var N = stdin.readLineSync();
      var n = int.tryParse(N!);
      var game2 = Game(maxRandom: n);
      int failGuess1 = 1;
      do{
        if(n == null) {
          stdout.write('Please guess the number between 1 to 100 : '); //ไม่ขึ้นบันทัดใหม่
        }
        else{
          stdout.write('Please guess the number between 1 to $N : ');
        }
        //print('Please guess the number between 1 to 100');
        var input = stdin.readLineSync();  // รับค่าจากคีบอด  readLineSync() เป็น String?
        var guess2 = int.tryParse(input!); // แปลงสตริงเป็นจำนวนเต็ม ที่ไม่ null เลยใส่ ! ไว้

        if(guess2 == null){
          print('please enter number only');
          continue;
        }
        result2 = game2.doGuess(guess2);
        if(result2==0){
          failGuess1++;
        }
      }
      while(result2 != 1);
      myList.add(failGuess1);

    }
    else if(choose == 'n'|| choose == 'N'){ //ถ้าไม่เล่นต่อ เปลี่ยนค่า time แล้วออกจากลูปไป
      time = 1;

    }
    else{
      //print('Play again?');
      //print('เล่นอีกให้พิมพ์ "Y/y" ไม่เล่นต่อพิมพ์ "N/n"');
      //choose = stdin.readLineSync();
      continue;
    }
  }
  while(time==0);

  var AllPlay = myList.length;
  print("'you've play $AllPlay games");

  for (var i = 0; i < myList.length; i++) {
    var Allguess = myList[i];
    print('Game #${i+1}: '+'$Allguess Guesses');
  }

}