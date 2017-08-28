describe Range do
  it do
    expect_roundtrip "a".."z"
    expect_roundtrip 1..40
    expect_roundtrip 15...90
    expect_roundtrip 4.1...4.9
    expect_roundtrip 70..60
    expect_roundtrip 1..1_000_000_000_000
  end
end
