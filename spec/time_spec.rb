describe Time do
  it do
    # Using Rational() instead of more obvious Floats
    # to simplify tests
    expect_roundtrip Time.new(2007,11,6,17,10,0,"+09:00")
    expect_roundtrip Time.new(2007,11,6,17,10,Rational(123456, 1_000_000),"+09:00")
    expect_roundtrip Time.at(946702800)
    expect_roundtrip Time.at(-284061600)
    expect_roundtrip Time.at(Rational(946684800_234, 1000))
    expect_roundtrip Time.at(946684800, Rational(123456_789, 1000))
  end
end
