require 'pry'
# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Write a program that deciphers and prints each of these names.

# Algorithm:
#   - Method to process each name
#     - init empty array called translated
#     - For each name in names
#       - add translated name to translated
#     - join translated array, separate by \n
#
#   - Method to translate name
#     - init new string
#     - for each char in input string
#       - next if not a letter
#       - get ascii value of char (ord)
#       - add 13, convert back to char (chr)
#         - if result is not a letter, subtract 26 from ord
#         - add result to string
#

name_list = <<~MSG
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
MSG

name_array = name_list.split("\n")

def translate_list(names)
  translated_names = []

  names.each do |name|
    translated_names << translate_name(name)
  end

  translated_names.join("\n")
end

def translate_name(name)
  translated_name = name.chars.map do |char|
    char.match(/[A-Za-z]/) ? translate_letter(char) : char
  end

  translated_name.join
end

def translate_letter(letter)
  case letter
  when ('a'..'m'), ('A'..'M') then (letter.ord + 13).chr
  else (letter.ord - 13).chr
  end
end

puts translate_list(name_array)
