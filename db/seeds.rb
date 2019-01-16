require_relative('../models/hogwarts')
require_relative('../models/houses')

Hogwarts.delete_all()
Houses.delete_all()

student1 = Hogwarts.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 15,
  })

student2 = Hogwarts.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Gryffindor",
  "age" => 14,
  })

student1.save()
student2.save()


house1 = Houses.new({
  "name" => "Gryffindor",
  "logo_url" => "https://images-na.ssl-images-amazon.com/images/I/61CT7wPwCWL._SX355_.jpg"
  })

house2 = Houses.new({
  "name" => "Ravenclaw",
  "logo_url" => "https://i.pinimg.com/originals/f5/b9/02/f5b902b26576787e83fb48acd8169838.jpg"
  })

house3 = Houses.new({
  "name" => "Hufflepuff",
  "logo_url" => "https://hottopic.scene7.com/is/image/HotTopic/10430666_hi?$pdp_hero_standard$"
  })

house4 = Houses.new({
  "name" => "Slytherin",
  "logo_url" => "https://www.logolynx.com/images/logolynx/53/5390e974544de6279c4d9cb6253e3a2c.jpeg"
  })

house1.save()
house2.save()
house3.save()
house4.save()
