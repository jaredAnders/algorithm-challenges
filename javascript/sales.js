const fs = require('fs');

fs.readFile('products.tab', 'utf8', (error, productData) => {
  productsData = productData.split('\n').map((row) => {return row.split('\t')});
  // console.log(products);

  let categories = [];
  for (let row in productsData) {
    categories.push(productsData[row][1]);
  }
  categories = [...new Set(categories)];
  // console.log(categories);

  categorySales = {};
  for (let category in categories) {
    categorySales[categories[category]] = 0;
  }
  // console.log(categorySales);

  let candies = [];
  for (let row in productsData) {
    if (productsData[row][1] === 'Candy') {
      candies.push(productsData[row][0]);
    }
  }
  // console.log(candies);

  fs.readFile('sales.tab', 'utf8', (error, salesData) => {
    salesData = salesData.split('\n').map((row) => {return row.split('\t')});

    for (let row in salesData) {
      let productName = salesData[row][0];
      let sales = parseFloat(salesData[row][1]);
      let productCategory;
      for (let product in productsData) {
        if (productsData[product][0] === productName) {
          productCategory = productsData[product][1];
        }
      }
      // let product = productsData.filter((v, i) => {
      //   return v[0] === productName });
      // let productCategory = product[1];
      // console.log(productCategory);

      categorySales[productCategory] += sales;
    }
    // console.log(categorySales);
    let categoriesBySales = [];
    for (let category in categorySales) {
      categoriesBySales.push([category, categorySales[category]]);
    }

    categoriesBySales.sort((a, b) => {
      return b[1] - a[1]
    });

    let topFive = categoriesBySales.slice(1,6);

    console.log(`Top 5 Categories by Sales: ${topFive}`);

    let candySales = [];

    for (let row in salesData) {
      if (candies.indexOf(salesData[row][0]) !== -1) {
        candySales.push(salesData[row]);
      }
    }

    let topCandy = candySales.sort((a, b) => {
      return b[1] - a[1]
    }).slice(0,1);

    console.log(`Top Candy by Sales: ${topCandy}`);

  });
});
