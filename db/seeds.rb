User.create!([
  {password_digest: "$2a$10$zsjfpSV0eLluincga56wUumb7kGWM0amvsvfjsrTDSW8iCAISl.iS", email: "lawrence.ml@gmail.com"},
  {password_digest: "$2a$10$LKfXjD1YxP08KY0BVL1WdOCig9tbjUbyzGWrltVvkKHeUrN7kEqA6", email: "jonb@gmail.com"},
  {password_digest: "$2a$10$FJBRMLNY59syvqJ07tZh9OoxBksaxrl0Tc/HUUFd9ik/NvFmmdVbi", email: "christa@gmail.com"},
  {password_digest: "$2a$10$JNOU0UaZ4ZAC8vNInIJbWuDT6KrytKvWlqRMrmzbsOJQOTbAt/7BK", email: "mark@gmail.com"}
])

Buyer.create!([
  {name: "Steve Horin", email: "sph@aol.com"},
  {name: "Chase Bepko", email: "chase@gmail.com"},
  {name: "Logan Lawrence", email: "logan@gmail.com"},
  {name: "Greg Horn", email: "greghorn@gmail.com"}
])

Listing.create!([
  {street: "413 Keller Dr", city: "Dallas", state: "TX", zip_code: "76248", property_type: "bi level", bedrooms: 3, bathrooms: 2, list_price: 325000, user_id: 1},
  {street: "221 Millville Ave", city: "Vineland", state: "NJ", zip_code: "08332", property_type: "rancher", bedrooms: 3, bathrooms: 2, list_price: 275000, user_id: 3},
  {street: "965 Richland Rd", city: "Williamstown", state: "NJ", zip_code: "08094", property_type: "rancher", bedrooms: 3, bathrooms: 1, list_price: 125000, user_id: 2},
  {street: "6024 Greenmeadow Ave", city: "Baltimore", state: "MD", zip_code: "21209", property_type: "Apartment", bedrooms: 2, bathrooms: 1, list_price: 1200, user_id: 1},
  {street: "4800 Seton Circle", city: "Baltimore", state: "MD", zip_code: "21215", property_type: "muti-level", bedrooms: 4, bathrooms: 3, list_price: 250000, user_id: 2},
  {street: "123 Pine St", city: "Pikesville", state: "MD", zip_code: "21208", property_type: "bi-level", bedrooms: 2, bathrooms: 2, list_price: 175000, user_id: 1},
  {street: "2233 Main St", city: "New York", state: "NY", zip_code: "10004", property_type: "colonial", bedrooms: 4, bathrooms: 3, list_price: 380000, user_id: 1},
  {street: "123 main st", city: "baltimore", state: "MD", zip_code: "21209", property_type: "rancher", bedrooms: 4, bathrooms: 2, list_price: 312000, user_id: 1}
])

Appointment.create!([
  {date: "2018-12-26 18:00:00", buyer_id: 2, listing_id: 2},
  {date: "2018-12-28 20:00:00", buyer_id: 3, listing_id: 3},
  {date: "2019-01-03 16:00:00", buyer_id: 3, listing_id: 4},
  {date: "2018-12-30 14:30:00", buyer_id: 2, listing_id: 6},
  {date: "2018-12-28 21:15:00", buyer_id: 1, listing_id: 6},
  {date: "2018-12-26 00:00:00", buyer_id: 1, listing_id: 1},
  {date: "2019-01-03 21:00:00", buyer_id: 1, listing_id: 3},
  {date: "2019-01-07 18:00:00", buyer_id: 3, listing_id: 2},
  {date: "2019-01-10 18:30:00", buyer_id: 3, listing_id: 5}
])

