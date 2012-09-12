puts "----- Opdracht 5.2 -----"

def clock
  counter = Integer
  time = Time.new
  counter = (time.hour > 12) ? (time.hour - 12) : time.hour

  if(block_given?)
    counter.times {
      yield()
    }
  else
    puts time
  end
end

clock {
  puts "DONG"
}

clock()