puts "----- Opdracht 4.1 -----"

class Persoon
  attr_accessor :naam, :leeftijd

  @@nPersonen = 0

  def initialize(naam, leeftijd)
    @naam = naam
    @leeftijd = leeftijd
    @@nPersonen += 1
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
puts p1
puts p2