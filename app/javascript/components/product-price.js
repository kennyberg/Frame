
const showPrice = (price) => {
  document.querySelector("#priceBox").innerHTML = "€ " + price
}

const filterPrice = (dimension, material) => {
  const prices = document.querySelector("#prices").dataset.prices
  const prices_parsed = JSON.parse(prices)
  let result = prices_parsed.filter(e => e.material == material);
  result = result.filter(e => e.dimension == dimension);
  return result[0].price
}

const displayPrice = () => {
  const selects = document.querySelectorAll("#new_product select");
  const material = document.querySelector("#material");
  const dimension = document.querySelector("#dimension");

  selects.forEach((select) => {
    select.addEventListener('change', (e) => {
      const dimension_value = dimension.value
      const material_value = material.value
      console.log(filterPrice(dimension_value, material_value))
      const final_price = filterPrice(dimension_value, material_value)
      showPrice(final_price)
    })
  })
}

export {displayPrice};

// "[{"material":2,"dimension":1,"price":50},{"material":2,"dimension":2,"price":80},{"material":2,"dimension":3,"price":110},{"material":2,"dimension":4,"price":140},{"material":2,"dimension":5,"price":180},{"material":1,"dimension":1,"price":39},{"material":1,"dimension":2,"price":70},{"material":1,"dimension":3,"price":99},{"material":1,"dimension":4,"price":110},{"material":1,"dimension":5,"price":150}]"
