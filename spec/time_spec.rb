describe Time do
  it do
    expect_roundtrip Time.new(2007,11,6,17,10,0, "+09:00")
    expect_roundtrip Time.at(946702800)
    expect_roundtrip Time.at(-284061600)
    expect_roundtrip Time.at(946684800.2).usec
    expect_roundtrip Time.at(946684800, 123456.789)
  end
end
