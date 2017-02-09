let getFactors = (num) => {
  let factors = [];
  for (i = 0; i <= num; i++) {
    if (num % i === 0) {
      factors.push(i);
    }
  }
  return factors.reverse();
}

let getLargestPrime = (factors) => {
  let primes = [];
  factors.forEach((num) => {
    if (getFactors(num).length == 2) {
      primes.push(num);
    }
  });
  return primes[0];
}

let largestPrime = (num) => {
  let factors = getFactors(num);
  let largestPrime = getLargestPrime(factors);
  return largestPrime;
}

let printPrime = (num) => {
  let prime = largestPrime(num);
  console.log(`Largest prime of ${num} is ${prime}`);
}

printPrime(21); // Largest prime of 21 is 7
printPrime(17); // Largest prime of 17 is 17
printPrime(99); // Largest prime of 99 is 11
