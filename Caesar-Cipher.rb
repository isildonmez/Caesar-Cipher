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


puts caesar_cipher("What a string!", 5)
puts caesar_cipher(" !", 5)
puts caesar_cipher("W!", 0)
puts caesar_cipher("What a string!", 57)
puts caesar_cipher(caesar_cipher("isici", 13), 13)

# Bmfy f xywnsl!
#  !
# W!
# Bmfy f xywnsl!
# isici
