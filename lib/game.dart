import 'dart:math';

class Game{
  int answer  = 0; // instance field

  Game({var maxRandom = 100}){
    var r = Random();
    print('ค่าคือ $maxRandom');
    if(maxRandom == null){
      answer = r.nextInt(100)+1; // +1 เอาค่า 1-100
      print('คำตอบ $answer');
    }
    else{
      answer = r.nextInt(maxRandom)+1; // +1 เอาค่า 1-100
      print('คำตอบ $answer');
    }

  }
  int doGuess(int num){
    if(num > answer){
      print('$num is too high');
      return 0;
    }
    else if(num < answer){
      print('$num is too low');
      return 0;
    }
    else{
      print('$num is correct');
      return 1;
    }
  }
}
