def caesar_cipher(text, offset=1)
    dc = ('a'..'z').to_a.zip(('a'..'z').to_a.rotate(offset)).to_h
    up = ('A'..'Z').to_a.zip(('A'..'Z').to_a.rotate(offset)).to_h

    encrypted = text.chars.map do |c|
        dc[c] || up[c] || c
    end

    encrypted.join
end

p caesar_cipher("Hello World!", 1) # "Ifmmp Xpsme!"
p caesar_cipher("Veni, vidi, vici", -3) # "Sbkf, sfaf, sfzf"
p caesar_cipher("T#E$S%T¨ U&&AIRir91", 5) # "Y#J$X%Y¨ Z&&FNWnw91"
p caesar_cipher("Hello World!", 26) # "Hello World!"
