describe Rational do
  it do
    expect_roundtrip Rational(0.3)       #=> (5404319552844595/18014398509481984)
    expect_roundtrip Rational('0.3')     #=> (3/10)
    expect_roundtrip Rational('2/3')     #=> (2/3)
    expect_roundtrip Rational(0.0)       #=> (0/1)
    expect_roundtrip Rational(-0.0)      #=> (0/1)
    expect_roundtrip Rational(-Math::PI) #=> (-884279719003555/281474976710656)
  end
end
