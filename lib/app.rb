require 'sinatra'
require 'sinatra/reloader' if development?
set :root, 'lib/app'

def caesar_cipher(string, factor)
  string.split("").map {|letter|
    ascii_code = letter.ord
    if ascii_code.between?(65, 90)
      ascii_code += factor
      if ascii_code > 90
        ascii_code = (ascii_code - 90) % 26 + 64
      end
    elsif ascii_code.between?(97, 122)
      ascii_code += factor
      if ascii_code > 122
        ascii_code = (ascii_code - 122) % 26 + 96
      end
    end
    ascii_code.chr
  }.join
end

get '/' do
  string = params["original_text"]
  factor = params["factor"].to_i
  code = ""
  if string && factor
    code = caesar_cipher(string, factor)
  end
  erb :index, :locals => {:code => code}
end