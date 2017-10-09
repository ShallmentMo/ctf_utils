require 'gmp'

# https://zhuanlan.zhihu.com/p/21858074
# RSAWienerAttack.wiener_attack(GMP::Z(17993), GMP::Z(90581))
module RSAWienerAttack
  # Return the continued fractions expansions of x / y
  def continued_fraction(x, y)
    ret = []
    while y != 0
      ret.push x.tdiv(y)
      x, y = y, x % y
    end
    ret
  end

  def expand(ctnf)
    ctnf.reverse!
    numerator = 0
    denominator = 1
    ctnf.each do |x|
      numerator, denominator = denominator, x * denominator + numerator
    end
    [numerator, denominator]
  end

  # Return the list of n progressive fraction
  def progressive_fraction(x, y)
    cfe = continued_fraction(x, y)
    ret = []
    1.upto(cfe.size - 1) do |i|
      ret.push(expand(cfe[0...i]))
    end
    ret
  end

  # Solve the equation: ax^2 +bx + c = 0
  def solve(a, b, c)
    par = (b * b - 4 * a * c).sqrt
    [(-b + par) / (2 * a), (-b - par) / (2 * a)]
  end

  def wiener_attack(e, n)
    res = progressive_fraction(e, n)
    res.each do |d, k|
      next if k.zero?
      next if (e * d - 1) % k != 0

      phi = (e * d - 1).div(k)
      p, q = solve(1, n - phi + 1, n)

      next unless p * q == n

      puts 'find it'
      puts p
      puts q
    end
  end

  module_function :continued_fraction, :expand, :progressive_fraction, :solve,
                  :wiener_attack
end
