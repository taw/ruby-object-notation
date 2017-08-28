require_relative "../lib/rbon"

RSpec.configure do |config|
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end

  def expect_roundtrip(object)
    expect(object).to roundtrip
  end
end

RSpec::Matchers.define :roundtrip do
  def match?(a,b)
    return true if a.equal?(b)
    return true if a.eql?(b)
    return true if a.is_a?(Array) and b.is_a?(Array) and a.size == b.size and a.zip(b).all?{|x,y| match?(x,y)}
    false
  end

  match do |object|
    # There's a good deal of hacks necessary
    # because of damn NANs
    decoded = RBON.decode(RBON.encode(object))
    match?(object, decoded)
  end

  failure_message do |object|
    decoded = RBON.decode(RBON.encode(object))
    "Expected `#{object}' to survive RBON round trip:\n" +
      object.inspect.gsub(/^/, "  ") +
    "\nInstead got:\n" +
      decoded.inspect.gsub(/^/, "  ")
  end
end
