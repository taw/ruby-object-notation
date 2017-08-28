describe Complex do
  it do
    expect_roundtrip Complex(1, 1)/2
    expect_roundtrip Complex(1, 1)/2.0
    expect_roundtrip Complex(0.0, 0.0)
    expect_roundtrip Complex(-0.0, 0.0)
    expect_roundtrip Complex(0.0, -0.0)
    expect_roundtrip Complex(-0.0, -0.0)
    expect_roundtrip Complex(Math::PI, -Math::PI)
  end
end
