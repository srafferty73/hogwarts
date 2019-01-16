require_relative('../models/hogwarts')

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
