require 'sinatra'
require 'sinatra/reloader' if development?

def ceasar_cipher(string, number = 0)
  string_array = string.split(//)
  new_array = []
  string_array.each do |char|
    temp = char.ord
    if (temp >= 65 && temp <= 90) || (temp >=97 && temp <= 122)
      number.abs.times do
        if number > 0
          temp += 1
        end
        if number < 0
          temp -= 1
        end
        if number < 0 && temp == 96
          temp = 122
        end
        if number < 0 && temp == 64
          temp = 90
        end
        if number > 0 && temp == 123
          temp = 97
        end
        if number > 0 && temp == 91
          temp = 65
        end
      end
    end
    new_array << temp.chr
  end
  new_array.join("")
end

get '/' do
  erb :index
end

post '/' do
  ceasar_string = params["text_input"]
  ceasar_number = params["cipher_key"].to_i
  ciphered_string = ceasar_cipher(ceasar_string, ceasar_number)
  erb :index, :locals => {:cipher => ciphered_string}
end
