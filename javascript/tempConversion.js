var readlineSync = require('readline-sync');

//choose conversion type
var conversionTypes = ['Fahrenheit to Celsius', 'Celsius to Fahrenheit'];
var selection = readlineSync.keyInSelect(conversionTypes, 'Convert: ');
console.log(conversionTypes[selection]);

//calculate conversion
var degrees = Number(readlineSync.question('\nEnter degrees:'));

if ( selection == 0) {
  degrees = (degrees - 32) * 5 / 9;
} else if (selection == 1) {
  degrees = (degrees * 9 / 5) + 32;
} else {
  console.log('Conversion cancelled');
}

//print results
console.log('It\'s ' + degrees + ' degrees outside!');
