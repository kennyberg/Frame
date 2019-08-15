import "bootstrap";
// below, we only import the displayPrice function (and not the file)
// to be able to import it, we also need to export it from the file where the function is built
import {displayPrice} from "../components/product-price"

// below, we must call the function (it is not sufficient just to import it)
displayPrice()
