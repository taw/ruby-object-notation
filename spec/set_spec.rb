describe Set do
  it do
    expect_roundtrip Set[]
    expect_roundtrip Set[1]
    expect_roundtrip Set[2,3,1]
    expect_roundtrip Set[Float::NAN, -Float::INFINITY, (-0.0), Set[], []]
  end
end
