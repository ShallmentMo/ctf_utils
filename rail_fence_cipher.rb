# https://en.wikipedia.org/wiki/Rail_fence_cipher
module RailFenceCipher
  # irb(main):001:0> RailFenceCipher.encrypt("THERE IS A CIPHER")
  # => "TEESCPEHRIAIHR"
  # irb(main):001:0> RailFenceCipher.encrypt("THERE IS A CIPHER", 3)
  # => "TRSIEHEAPREICH"
  def encrypt(plain_text, count = 2)
    chars = plain_text.delete(' ').chars
    arr = []
    (0..(count - 1)).each do |mod|
      arr.concat(chars.select.with_index { |_, i| i % count == mod })
    end
    arr.join
  end
  module_function :encrypt

  # irb(main):001:0> RailFenceCipher.decrypt('TEESCPEHRIAIHR')
  # => "THEREISACIPHER"
  # irb(main):001:0> RailFenceCipher.decrypt('TRSIEHEAPREICH', 3)
  # => "THEREISACIPHER"
  def decrypt(cipher_text, count = 2)
    arr = Array.new(cipher_text.size)
    size = (cipher_text.size / count.to_f).ceil
    cipher_text.chars.each_with_index do |c, i|
      arr[(i % size) * count + i / size] = c
    end
    arr.join
  end
  module_function :decrypt
end
