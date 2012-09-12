puts "----- Opdracht 5.3 -----"

class Array
  def each()
    puts self

    #self.length.times{|x, y|
      #puts x
      #puts y

      #yield(y)
    #}

    #if(block_given?)
      #puts args
      #yield(args)
    #end
  end
end

["apple", "pie", "cream"].each {|x| puts x}