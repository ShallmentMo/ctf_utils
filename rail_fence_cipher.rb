# https://en.wikipedia.org/wiki/Rail_fence_cipher
module RailFenceCipher
  # irb(main):001:0> RailFenceCipher.encrypt("THERE IS A CIPHER")
  # => "TEESCPEHRIAIHR"
  def encrypt(plain_text)
    chars = plain_text.delete(' ').chars
    (chars.select.with_index { |_, i| i.even? } +
      chars.select.with_index { |_, i| i.odd? }).join
  end
  module_function :encrypt

  # irb(main):001:0> RailFenceCipher.decrypt('TEESCPEHRIAIHR')
  # => "TEIEASICHPREHR"
  def decrypt(cipher_text)
    arr = Array.new(cipher_text.size)
    half_size = (cipher_text.size / 2.0).ceil
    cipher_text.chars.each_with_index do |c, i|
      arr[i < half_size ? i * 2 : (i - half_size) * 2 + 1] = c
    end
    arr.join
  end
  module_function :decrypt
end
