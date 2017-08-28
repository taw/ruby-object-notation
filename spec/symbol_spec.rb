describe Symbol do
  it do
    expect_roundtrip :a
    expect_roundtrip :@hello
    expect_roundtrip :"hello world"
    expect_roundtrip :"@$!,?"
  end
end
