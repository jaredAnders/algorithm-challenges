const test = 'teststring'

let dedupe = (string) => {
  return string.split('').map((letter, index) => {
    return string.indexOf(letter) === index ? letter : '';
  }).join('');
}

console.log(dedupe(test));
