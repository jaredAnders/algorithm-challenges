var readlineSync = require('readline-sync');

//choose conversion type
var conversionTypes = ['Fahrenheit to Celsius', 'Celsius to Fahrenheit'];
var selection = readlineSync.keyInSelect(conversionTypes, 'Choose conversion: ');

//calculate conversion
function convert (selection) {
  var conversion = selection == 0 ? {from: 'F', to: 'C'}: {from: 'C', to: 'F'};
  var degrees = Number(readlineSync.question('Enter degrees '+ conversion.from + ': '));
  degrees = selection == 0 ? (degrees - 32) * 5 / 9 : degrees = (degrees * 9 / 5) + 32;
  console.log('It\'s ' + degrees.toFixed(1) + ' degrees '+ conversion.to +' outside!');
};

switch(selection) {
  case 0:
    convert(selection);
    break;
  case 1:
    convert(selection);
    break;
  case -1:
    console.log('Conversion cancelled');
};
