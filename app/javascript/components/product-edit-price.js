
const showPrice = (price) => {
  // below, we select the element on the html where we would like to display the price
  // then we do innerHTML so we can access the text field of that html element
  // we insert the price passed as argument inside that html text field
  document.querySelector("#priceBox").innerHTML = "<b>" + "€ " + price + "</b>"
}

const filterPrice = (dimension, material) => {
  // below, we select the data-* attribute => data-prices="<%= @prices.to_json %>" inserted in the html
  // that data-* attribute give us access to something created in the ruby file through the html
  // @prices was an array of hashes built in the photos controller show
  // in the data-* attribute, we transform that array into a json file
  // so, below, we are selecting a json file
  const prices = document.querySelector("#prices").dataset.prices
  // we parse that json file into a js object (i.e. the equivalent of a hash in ruby) so that we can read it with js
  // that js object is composed of FrameCombo.all in the form of “key: value” pairs
  const prices_parsed = JSON.parse(prices)
  // below, we filter that object using the filter js built-in method, the equivalent of .select do in ruby
  // we filter that object based on the material & dimension IDs that have been passed as arguments in the method
  let result = prices_parsed.filter(e => e.material == material);
  result = result.filter(e => e.dimension == dimension);
  // once we've found the correct object, we just want to return the price inserted in that object
  return result[0].price
}

const displayEditPrice = () => {
  // below, we select (so "all") the two selectors to then be able to put an event listener on them
  const selects = document.querySelectorAll(".edit_product select");
  // below, we select each frame info to then access their ID
  const material = document.querySelector("#material");
  const dimension = document.querySelector("#dimension");


  // below, we iterate through the two selectors so that we can put an event listener on both of them
  selects.forEach((select) => {
    select.addEventListener('change', (e) => {
      // below, dimension.value returns the ID of the dimension currently selected
      const dimension_value = dimension.value
      // below, material.value returns the ID of the material currently selected
      const material_value = material.value
      // below, we use the filterPrice function defined on top of this file
      // we pass the current dimension & material IDs as arguments of that method
      const final_price = filterPrice(dimension_value, material_value)
      // below, we use the showPrice function defined on top of this file
      // we pass the price corresponding to the current dimension & material IDs as arguments of that method
      showPrice(final_price)

      if (material.value === "" || dimension.value === "" ) {
        button.disabled = true;
      }
      else {
        button.disabled = false;
      }
    })
  })
}

// we only export the displayPrice function inside the application.js file (and not the other functions)
// to make it work, we also need to import it in the application.js and then call it in that same file
export {displayEditPrice};

