let caesar = (string, offset) => {
  return string.toUpperCase().split('').map((letter) => {
    letter = letter.charCodeAt() + offset;
    letter > 90 ? letter = letter - 26 : letter;
    letter < 65 ? letter = letter + 26 : letter;
    return String.fromCharCode(letter);
  }).join('');
};

const test = caesar('teststringabcxyz', 5);
console.log(test); // => YJXYXYWNSLFGHCDE
console.log(caesar(test, -5)); // => TESTSTRINGABCXYZ
