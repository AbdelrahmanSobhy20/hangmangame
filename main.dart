import 'dart:io';
import 'dart:math';
import 'dart:core';

void main() {
  List<String> words = ["book", "bike", "apple"];
  var random = Random();
  String hiddenText = words[random.nextInt(words.length)];
  List<String> textArray = hiddenText.split('');
  List<String> myAnswers = List.filled(textArray.length, '');

  for (int i = 0; i < textArray.length; i++) {
    myAnswers[i] = '?';
  }

  bool finished = false;
  int lives = 6;
  while (finished == false) {
    print("*****************");
    dynamic letter = stdin.readLineSync();
    while (letter?.length != 1) {
      print("Error - Try Again");
      letter = stdin.readLineSync();
    }
    bool found = false;
    for (int i = 0; i < textArray.length; i++) {
      if (letter?[0] == textArray[i]) {
        myAnswers[i] = textArray[i];
        found = true;
      }
    }
    if (!found) {
      lives--;
      print("Wrong Letter");
    }
    bool done = true;
    for (int i = 0; i < myAnswers.length; i++) {
      if (myAnswers[i] == '?') {
        print(" _");
        done = false;
      } else {
        print("" + myAnswers[i]);
      }
    }
    print("\n" + "Lives Left:" + lives.toString());
    drawHangman(lives);

    if (done) {
      print("Congratulation");
      finished = true;
    }

    if (lives <= 0) {
      print("You are dead");
      finished = true;
    }
  }
  print(hiddenText);
}

void drawHangman(int l) {
  if (l == 6) {
    print("|----------");
    print("|");
    print("|");
    print("|");
    print("|");
    print("|");
    print("|");
  } else if (l == 5) {
    print("|----------");
    print("|    O");
    print("|");
    print("|");
    print("|");
    print("|");
    print("|");
  } else if (l == 4) {
    print("|----------");
    print("|    O");
    print("|    |");
    print("|");
    print("|");
    print("|");
    print("|");
  } else if (l == 3) {
    print("|----------");
    print("|    O");
    print("|   -|");
    print("|");
    print("|");
    print("|");
    print("|");
  } else if (l == 2) {
    print("|----------");
    print("|    O");
    print("|   -|-");
    print("|");
    print("|");
    print("|");
    print("|");
  } else if (l == 1) {
    print("|----------");
    print("|    O");
    print("|   -|-");
    print("|   /");
    print("|");
    print("|");
    print("|");
  } else {
    print("|----------");
    print("|    O");
    print("|   -|-");
    print("|   /|");
    print("|");
    print("|");
    print("|");
  }
}
