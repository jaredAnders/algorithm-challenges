'use strict';

var _ = {
  join: (array, separator = ',') => {
    let string = '';
    for (let [index, value] of array.entries()) {
      string += value;
      if (index !== array.length - 1) {string += separator};
    }
    return string;
  }
}

const value = _.join(["hello", "world", "goodbye"], ", ")

console.log(value);
