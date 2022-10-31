library my_prj.globals;

import 'dart:math';

var random = new Random();
late var randomNumber = random.nextInt(code.length);
late var randomNumberFromList = code.elementAt(randomNumber);
List code = [
  '1234',
  '4636',
  '8563',
  '1204',
  '6538',
  '4723',
  '9597',
  '5645',
  '2952',
  '3907',
];
