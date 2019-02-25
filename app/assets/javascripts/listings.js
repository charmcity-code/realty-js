$(function() {});

const getListings = () => {
  $.ajax({
    type: "get",
    url: "/listings",
    dataType: "json",
    success: function(response) {}
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
  }
}
