$(function() {
  getListings();
  nextListing();
  previousListing();
});

let nextId;

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
  createListing();
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

const createListing = () => {
  $("#new_listing").submit(function(e) {
    e.preventDefault();

    let values = $(this).serialize();
    let newListing = $.post("/listings", values);

    newListing.done(function(response) {
      let listing = response;
      const newListing = new Listing(listing);
      const newListingHtml = newListing.listingHTML();
      document.getElementById("ajax-listings").innerHTML += newListingHtml;
      $("form").trigger("reset");
    });
  });
};

const nextListing = () => {
  $(".js-next").click(function(e) {
    e.preventDefault();
    nextId = parseInt($(".js-next").attr("data-id")) + 1;
    showListing();
  });
};

const previousListing = () => {
  $(".js-previous").click(function(e) {
    e.preventDefault();
    nextId = parseInt($(".js-next").attr("data-id")) - 1;
    showListing();
  });
};

const showListing = () => {
  $(".appointmentName").text("");
  $(".appointmentDate").text("");

  $.getJSON("/listings/" + nextId, function(response) {
    $(".listingDate").text(
      "Date Listed: " + moment(response.created_at).format("MMM DD, YYYY")
    );
    $(".listingStreet").text(response.street);
    $(".listingCityStZip").text(
      `${response.city}, ${response.state} ${response.zip_code}`
    );
    $(".listingPropertyType").text("Property Type: " + response.property_type);
    $(".listingBedrooms").text("Number of Bedrooms: " + response.bedrooms);
    $(".listingBathrooms").text("Number of Bathrooms: " + response.bathrooms);
    $(".listingPrice").text(
      "List Price: $" + response.list_price.toLocaleString("en")
    );

    if (response.buyers.length !== 0) {
      for (const element of response.buyers) {
        $(".appointmentName").append(element.name + `<br>`);
      }

      for (const element of response.appointments) {
        $(".appointmentDate").append(
          moment(element.date).format("MMM DD, YYYY") + `<br>`
        );
      }
    } else {
      $(".appointmentName").append(
        "There are no appointments for this listing."
      );
    }
    // re-set the id to current on the link
    $(".js-next").attr("data-id", response["id"]);
  });
};
