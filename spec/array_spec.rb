describe Array do
  it do
    expect_roundtrip []
    expect_roundtrip [0,0,0]
    expect_roundtrip [[[]], [], [[]]]
    expect_roundtrip [Float::NAN, -Float::INFINITY, (-0.0)]
  end
end
