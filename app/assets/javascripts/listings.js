$(function() {
  getListings();
  // showListing();
  listenForClick();
});

const listenForClick = () => {
  $(".js-next").click(function(e) {
    e.preventDefault();
    alert("test!");
  });
};

const getListings = () => {
  $.ajax({
    type: "get",
    url: "/listings",
    dataType: "json",
    success: function(response) {
      response.forEach(listing => {
        const newListing = new Listing(listing);
        const newListingHtml = newListing.listingHTML();
        document.getElementById("ajax-listings").innerHTML += newListingHtml;
      });
    }
  });
};

class Listing {
  constructor(obj) {
    this.id = obj.id;
    this.street = obj.street;
    this.city = obj.city;
    this.state = obj.state;
    this.zip_code = obj.zip_code;
    this.property_type = obj.property_type;
    this.bedrooms = obj.bedrooms;
    this.bathrooms = obj.bathrooms;
    this.list_price = obj.list_price;
    this.created_at = obj.created_at;
  }
}

Listing.prototype.listingHTML = function() {
  return `
    <ul>
    <li>
      Date Listed: ${moment(this.created_at).format("MMM DD, YYYY")}<br>
      Property Location:<br>
      ${this.street}<br>
      ${this.city}, ${this.state} ${this.zip_code}<br>
      <a href="/listings/${this.id}">Details</a>
    </li>
    </ul
  `;
};

const showListing = () => {
  $.ajax({
    type: "get",
    url: this.href,
    dataType: "json",
    success: function(response) {
      $(".listingDate").append(
        moment(response.created_at).format("MMM DD, YYYY")
      );
      $(".listingStreet").append(response.street);
      $(".listingCityStZip").append(
        `${response.city}, ${response.state} ${response.zip_code}`
      );
      $(".listingPropertyType").append(response.property_type);
      $(".numberBedrooms").append(response.bedrooms);
      $(".numberBathrooms").append(response.bathrooms);
      $(".listingPrice").append(response.list_price.toLocaleString("en"));
    }
  });
};
