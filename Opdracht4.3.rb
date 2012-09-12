puts "----- Opdracht 4.3 -----"

class Persoon
  attr_accessor :id, :naam, :leeftijd

  @@nPersonen = 0
  @@personenArray = Array.new()

  def initialize(naam, leeftijd)
    @naam = naam
    @leeftijd = leeftijd
    @@nPersonen += 1
    @id = @@nPersonen
    @@personenArray.push(self)
  end

  def self.find(id)
    @@personenArray.each { |persoon|
      if(persoon.id == id)
        return persoon.toString
      end
    }
    return nil
  end

  def self.update_attributes(attributes = {})
    puts attributes

    attributes.each{ |updatePersoon, updateValues| #Loop through all "person" attributes
      @@personenArray.each { |persoon| #Loop through all the person-objects
        if(persoon.id == updateValues[:id])
          puts "----- Update #{persoon.naam} -----"
          if(updateValues[:leeftijd] != nil)
            persoon.leeftijd = updateValues[:leeftijd]
          end
          return persoon.toString
        end
      }
    }
    return nil
  end

  def self.nPersonen
    @@nPersonen
  end

  def toString()
    "Persoon " + @naam + " is " + @leeftijd.to_s + " jaar"
  end
end

p1 = Persoon.new("Piet", 20)
p2 = Persoon.new("Karel", 54)

puts "Aantal personen: " + Persoon.nPersonen.to_s
#puts p1
#puts p2

p = Persoon.find(2);
puts p
puts p.class

puts Persoon.update_attributes(params = {
    :persoon => {
        :id => 2,
        :leeftijd => 78
    }
})