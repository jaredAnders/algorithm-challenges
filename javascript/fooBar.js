var readlineSync = require('readline-sync');

var total = Number(readlineSync.question('How many numbers: '));

for ( var i = 1 ; i < total; i++) {
  if (i % 3 == 0 && i % 5 == 0) {
    console.log("Foobar");
  } else if (i % 3 == 0) {
    console.log("Foo");
  } else if (i % 5 == 0) {
    console.log("Bar");
  } else {
    console.log(i);
  };
};
