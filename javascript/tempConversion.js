var readlineSync = require('readline-sync');

var degrees = Number(readlineSync.question('\nEnter degrees in Celsius: '));
degrees = (degrees * 9 / 5) + 32;
console.log('It is ' + degrees + ' degrees outside!');
