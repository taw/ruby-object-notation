describe Float do
  it do
    expect_roundtrip 0.0
    expect_roundtrip (-0.0)
    expect_roundtrip Math::PI
    expect_roundtrip Float::MIN
    expect_roundtrip Float::MAX
    expect_roundtrip (-Float::MIN)
    expect_roundtrip (-Float::MAX)
    expect_roundtrip Float::NAN
    expect_roundtrip Float::EPSILON
  end
end
