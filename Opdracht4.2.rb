require "./Opdracht4.1.rb"

puts "----- Opdracht 4.2 -----"

params = {}
personenArray = []

params = {
    :personen =>
        [
            {
                :naam => "Pietje",
                :leeftijd => 23
            },
            {
                :naam => "Kareltje",
                :leeftijd => 65
            }
        ]
}

params.each { |key, value|
  value.each { |object|
    personenArray.push(Opdracht1.new(object[:naam], object[:leeftijd]))
  }
}

puts personenArray.to_s