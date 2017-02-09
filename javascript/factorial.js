let calculateFactorial = (num) => {
  let product = 1;
  for (let i = 1; i <= num; i++) {
    product = product * i;
  }
  return product;
}

let validateInput = (num) => {
  if (num < 0) {
    return 'negative number';
  }
  if (num === 0) {
    return 0;
  }
  return true;
}

let factorialize = (num) => {
  let validStatus = validateInput(num);
  if (validStatus !== true) {
    return validStatus;
  }
  return calculateFactorial(num);
}

console.log(factorialize(-10)); // returns 'negative number'
console.log(factorialize(0)); // returns 0
console.log(factorialize(10)); // returns 3628800
