describe Hash do
  it do
    expect_roundtrip({})
    expect_roundtrip({"A" => 1, "B" => 2})
    expect_roundtrip({a: :b, c: :d})
    # Can't have both 0.0 and -0.0 as keys
    expect_roundtrip({
      Float::NAN => Float::INFINITY,
      -Float::INFINITY => Float::NAN,
      Float::INFINITY => -Float::INFINITY,
      (-0.0) => 0,
      0 => (-0.0),
    })
  end
end
