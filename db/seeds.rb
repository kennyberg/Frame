require 'open-uri'

supplier_attributes = [
   {
    company_name: 'Imprimeur & Encadreur 1978',
    address_line_1: '3 rue de la boetie',
    address_zipcode: '75000',
    address_city: 'Paris',
    country: 'France',
    delivering_region: 'Europe'
   },
   {
    company_name: 'ABC Everything',
    address_line_1: '43rd street New Jersey, Yorkshire',
    address_zipcode: '3405 HF 43',
    address_city: 'Yorkshire',
    country: 'United-States',
    delivering_region: 'America'
   },
   {
    company_name: 'Zipola PF',
    address_line_1: '45 del cambiosa',
    address_zipcode: '43 40 RF',
    address_city: 'Kuala Lumpur',
    country: 'Malaysia',
    delivering_region: 'Asia'
   }
]
Supplier.create!(supplier_attributes)

user_attributes = [
  {
    email: 'kenny@gmail.com',
    first_name: 'kenny',
    last_name: 'berg',
    password: "password"
  },

  {
    email: 'caroline@gmail.com',
    first_name: 'caroline',
    last_name: 'dupre',
    password: "password"
  }
]
User.create!(user_attributes)

# --------------------------------------------------

# photo_1 = Photo.new(
#   title: "A beautiful photo",
#   remote_api_url: "https://images.pexels.com/photos/2174656/pexels-photo-2174656.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
# )
# photo_1.remote_api_url = "https://images.pexels.com/photos/2174656/pexels-photo-2174656.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
# photo_1.save!

# http://sebelas-am-motion.com/wp-content/uploads/2015/03/camera-photography-art-photo-hd-orvya0bsf.jpg
# https://images.unsplash.com/photo-1533142266415-ac591a4deae9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
# https://images.pexels.com/photos/2132126/pexels-photo-2132126.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260
# https://images.pexels.com/photos/2662086/pexels-photo-2662086.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260
# https://images.pexels.com/photos/2249602/pexels-photo-2249602.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260
# https://images.pexels.com/photos/2533092/pexels-photo-2533092.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260
# https://images.pexels.com/photos/2155749/pexels-photo-2155749.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260

# --------------------------------------------------

frame_material_attributes = [
  {
    name: 'Wood'
  },

  {
    name: 'Aluminium'
  }
]
FrameMaterial.create!(frame_material_attributes)

frame_dimension_attributes = [
  {
    height: 40,
    width: 60,
    format: '40x60cm'
  },

  {
    height: 60,
    width: 90,
    format: '60x90cm'
  },

  {
    height: 80,
    width: 120,
    format: '80x120cm'
  },

  {
    height: 100,
    width: 150,
    format: '100x150cm'
  },

  {
    height: 60,
    width: 40,
    format: '60x40cm'
  }
]
FrameDimension.create!(frame_dimension_attributes)

frame_combo_attributes = [
  {
    frame_material_id: 2,
    frame_dimension_id: 1,
    price: 50
  },

  {
    frame_material_id: 2,
    frame_dimension_id: 2,
    price: 80
  },

  {
    frame_material_id: 2,
    frame_dimension_id: 3,
    price: 110
  },

  {
    frame_material_id: 2,
    frame_dimension_id: 4,
    price: 140
  },

  {
    frame_material_id: 2,
    frame_dimension_id: 5,
    price: 180
  }
]
FrameCombo.create!(frame_combo_attributes)

puts "Finished"

