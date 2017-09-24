# https://baike.baidu.com/item/当铺密码/19848621
module PawnshopCode
  MAPPING = {
    0 => '口',
    1 => '由',
    2 => '中',
    3 => '人',
    4 => '工',
    5 => '大',
    6 => '王',
    7 => '夫',
    8 => '井',
    9 => '羊'
  }.freeze

  INVERT_MAPPING = MAPPING.invert

  # irb(main):001:0> PawnshopCode.encrypt("0 1 2 3 4 5 6 7 8 9")
  # => "口 由 中 人 工 大 王 夫 井 羊"
  def encrypt(plain_text)
    plain_text.chars.map do |c|
      if /\d/ =~ c
        MAPPING[c.to_i]
      else
        c
      end
    end.join
  end
  module_function :encrypt

  # irb(main):001:0> PawnshopCode.decrypt("口 由 中 人 工 大 王 夫 井 羊")
  # =>  "UIFSF JT B DJQIFS"
  def decrypt(cipher_text)
    cipher_text.chars.map do |c|
      if INVERT_MAPPING.keys.include?(c)
        INVERT_MAPPING[c]
      else
        c
      end
    end.join
  end
  module_function :decrypt
end
