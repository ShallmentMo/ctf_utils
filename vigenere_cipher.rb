require './caesar_cipher'

# https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher
module VigenereCipher
  # irb(main):001:0> VigenereCipher.encrypt("BLOCKCIPHERDESIGNPRINCIPLE", 'COMPUTER')
  # =>  "DZAREVMGJSDSYLMXPDDXHVMGNS"
  def encrypt(plain_text, key)
    expanded_key =
      (key * (plain_text.size / key.size + 1))[0..(plain_text.size - 1)]
    plain_text.chars.map.with_index do |char, index|
      CaesarCipher.encrypt(char, expanded_key[index].ord - 'A'.ord)
    end.join
  end
  module_function :encrypt

  # irb(main):001:0> VigenereCipher.decrypt("DZAREVMGJSDSYLMXPDDXHVMGNS", 'COMPUTER')
  # =>  "BLOCKCIPHERDESIGNPRINCIPLE"
  def decrypt(cipher_text, key)
    expanded_key =
      (key * (cipher_text.size / key.size + 1))[0..(cipher_text.size - 1)]
    cipher_text.chars.map.with_index do |char, index|
      CaesarCipher.decrypt(char, expanded_key[index].ord - 'A'.ord)
    end.join
  end
  module_function :decrypt
end
