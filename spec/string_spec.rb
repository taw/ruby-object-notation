describe String do
  it do
    expect_roundtrip ""
    expect_roundtrip "hello, world!"
    expect_roundtrip %q[' #{} "]
  end
end
