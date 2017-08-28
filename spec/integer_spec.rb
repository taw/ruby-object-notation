describe Integer do
  it do
    expect_roundtrip 0
    expect_roundtrip 42
    expect_roundtrip (-42)
    expect_roundtrip 3**100
    expect_roundtrip (-3**100)
  end
end
