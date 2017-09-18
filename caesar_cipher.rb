# https://en.wikipedia.org/wiki/Caesar_cipher
module CaesarCipher
  # irb(main):001:0> CaesarCipher.encrypt("THERE IS A CIPHER", 1)
  # =>  "UIFSF JT B DJQIFS"
  def encrypt(plain_text, shift)
    plain_text.chars.map do |c|
      if /[[:alpha:]]/ =~ c
        ord = c.ord
        base = ord > 97 ? 97 : 65
        ((ord - base + shift) % 26 + base).chr
      else
        c
      end
    end.join
  end
  module_function :encrypt

  # irb(main):001:0> CaesarCipher.decrypt("UIFSF JT B DJQIFS", 1)
  # =>  "UIFSF JT B DJQIFS"
  def decrypt(cipher_text, shift)
    encrypt(cipher_text, 26 - shift)
  end
  module_function :decrypt
end
