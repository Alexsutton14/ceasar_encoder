require 'sinatra'
require 'sinatra/reloader' if development?

def ceasar(input_string, offset)
  if input_string == nil
    return ""
  end
offset = offset.to_i
output = ""

#reduces offset if greater than one full loop of alphabet
while offset > 25 do
    offset -= 26
end
while offset < -25
    offset += 26
end

  input_string.chars.each do |character|
    ord = character.ord
    if (65..90) === ord
      ord += offset
      if ord > 90
        ord -= 26
      elsif ord < 65
        ord += 26
      end
    elsif (97..122) === ord
      ord += offset
      if ord > 122
        ord -= 26
      elsif ord < 97
        ord += 26
      end
    end
    output += ord.chr
  end
  return output
end

    get '/' do
      string = params["string"]
      offset = params["offset"]
      encoded_string = ceasar(string, offset)
      erb :index, :locals => {:encoded_string => encoded_string}
    end