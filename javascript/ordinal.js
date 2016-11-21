var readlineSync = require('readline-sync');

var number = Number(readlineSync.question('Enter a number: '));

function addSuffix (number){
  if (number > 10 && number < 20) {
    return number + 'th';
  } else {
    switch (number % 10) {
      case 1:
        return number + 'st';
        break;
      case 2:
        return number + 'nd';
        break;
      case 3:
        return number + 'rd';
        break;
      default:
        return number + 'th';
    }
  }
};

console.log(addSuffix(number));
