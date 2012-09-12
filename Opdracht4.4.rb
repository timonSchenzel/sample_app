puts "----- Opdracht 4.4 -----"

class Persoon
  attr_accessor :id, :naam, :voornaam, :geslacht, :geboortedatum

  @@nPersonen = 0
  @@idCounter = 0
  @@instances = {}
  @@personenArray = Array.new()

  def initialize(attributes = {})
    @naam = attributes[:naam]
    @voornaam = attributes[:voornaam]
    @geslacht = attributes[:geslacht]
    @geboortedatum = attributes[:geboortedatum]
    @@nPersonen += 1
    @@idCounter += 1
    @id = @@idCounter
    @@personenArray << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find(id)
    @@personenArray.each { |persoon|
      if(persoon.id == id)
        return persoon.to_s
      end
    }
    return nil
  end

  def self.findByName(naam)
    @@personenArray.each { |persoon|
      if(persoon.voornaam == naam)
        return persoon.to_s
      end
    }
    return nil
  end

  def self.edit(attributes = {})
    attributes.each { |updatePersoon, updateValues|
      @@personenArray.each { |persoon|
        if(persoon.id == updateValues[:id])
          puts "----- Update #{persoon.naam} -----"
          if(updateValues[:naam] != nil)
            persoon.naam = updateValues[:naam]
          end
          if(updateValues[:voornaam] != nil)
            persoon.voornaam = updateValues[:voornaam]
          end
          return persoon.to_s
        end
      }
    }
    return nil
  end

  def delete()
    puts "----- Delete #{voornaam} #{naam} -----"
    #@@personenArray.delete(self)
    @@nPersonen -= 1
    #self.instance_variables.each{|v| self.instance_variable_set(v,nil)}
  end

  def self.nPersonen
    @@nPersonen
  end

  def to_s()
    if(block_given?)
      yield(naam, geboortedatum)
    else
      "Persoon #{voornaam} #{naam}"
    end
  end
end

class Docent < Persoon
  attr_accessor :docentcode, :salarisschaal

  def initialize(attributes = {})
    super(attributes)

    @docentcode = attributes[:docentcode]
    @salarisschaal = attributes[:salarisschaal]
  end

  def self.edit(attributes = {})
    super.edit(attributes)

    attributes.each{ |updatePersoon, updateValues| #Loop through all "person" attributes
      @@personenArray.each { |persoon| #Loop through all the person-objects
        if(persoon.id == updateValues[:id])
          puts "----- Update #{persoon.naam} -----"
          if(updateValues[:docentcode] != nil)
            persoon.docentcode = updateValues[:docentcode]
          end
          if(updateValues[:salarisschaal] != nil)
            persoon.salarisschaal = updateValues[:salarisschaal]
          end
          return persoon.to_s
        end
      }
    }
    return nil
  end

  def self.allSlbers()
    #docentList = Array.new()
    studentList = Array.new()
    slbList = Array.new()

    #docentList = ObjectSpace.each_object(Docent).to_a
    studentList = ObjectSpace.each_object(Student).to_a

    studentList.each { |student|
      if(student.slber != nil && !slbList.include?(student.slber))
        slbList << student.slber
      end
    }
    return slbList
  end
end

class Student < Persoon
  attr_accessor :studentrichting, :slber

  def initialize(attributes = {})
    super(attributes)

    @studentrichting = attributes[:studentrichting]
    @slber = attributes[:slber]
  end

  def self.edit(attributes = {})
    super.edit(attributes)

    attributes.each{ |updatePersoon, updateValues| #Loop through all "person" attributes
      @@personenArray.each { |persoon| #Loop through all the person-objects
        if(persoon.id == updateValues[:id])
          puts "----- Update #{persoon.naam} -----"
          if(updateValues[:studentrichting] != nil)
            persoon.studentrichting = updateValues[:studentrichting]
          end
          if(updateValues[:slber] != nil)
            persoon.slber = updateValues[:slber]
          end
          return persoon.toString
        end
      }
    }
    return nil
  end
end

p1 = Persoon.new({
  voornaam: "Henk",
  naam: "de Graaf",
  geslacht: "m",
  geboortedatum: "26-09-1992"
})
puts "#{p1.class}:"
puts p1.to_s { |nm, l|
  "hallo #{nm}, geboren op #{l}"
}

d1 = Docent.new({
   voornaam: "Hans",
   naam: "Garretsen",
   geslacht: "m",
   geboortedatum: "12-03-1965",
   docentcode: 123,
   salarisschaal: 4000
})
puts "#{d1.class}:"

d2 = Docent.new({
  voornaam: "Jaap",
  naam: "Garretsen",
  geslacht: "m",
  geboortedatum: "12-05-1975",
  docentcode: 458,
  salarisschaal: 6000
})
puts "#{d2.class}:"

s1 = Student.new({
    voornaam: "Laura",
    naam: "de Boer",
    geslacht: "v",
    geboortedatum: "16-07-1990",
    studentrichting: "CMD-I",
    slber: "Hans Garretsen"
})
puts "#{s1.class}:"
puts s1.to_s

puts "----- All person-instances -----"
puts Persoon.all()
puts "----- All docent-instances -----"
puts Docent.all()
puts "----- All student-instances -----"
puts Student.all()
puts "----- Find Person with id 3 -----"
puts Persoon.find(3)
puts "----- Find person with name 'Henk' -----"
puts Student.findByName("Henk")

p1.delete()

puts Persoon.all()

puts "----- All Slbers -----"
puts Docent.allSlbers()