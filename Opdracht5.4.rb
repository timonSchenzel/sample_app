def content_tag(element = "div", attributes = {})
  result = ""
  result += "<#{element}"
  attributes.each{|key, value|
    result += " #{key}=\"#{value}\""
  }
  result += ">\n"

  if(block_given?)
    result += yield()
  end

  result += "\n</#{element}>"
end

puts(
    content_tag("div", {id: "main", class: "container"}) do
      content_tag("p") do
        "Belangrijke inhoud"
      end
    end
)

puts "End"