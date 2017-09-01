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
    return false unless a.class == b.class

    case a
    when Float
      a.equal?(b) or a.eql?(b)
    when Array
      a.size == b.size and (0...a.size).all?{|i| match?(a[i], b[i]) }
    when Hash
      # We're checking order for round trip
      match?(a.keys, b.keys) and a.keys.all?{|key| match?(a[key], b[key]) }
    else
      a.eql?(b)
    end
  end

  match do |object|
    # There's a good deal of hacks necessary
    # because of damn NANs
    encoded = RBON.encode(object)
    decoded = RBON.decode(encoded)
    match?(object, decoded)
  end

  failure_message do |object|
    encoded = RBON.encode(object)
    decoded = RBON.decode(encoded)
    encoded2 = RBON.encode(decoded)
    [
      "Expected `#{object}' to survive RBON round trip:",
      object.inspect.gsub(/^/, "  "),
      "Encoded as:",
      encoded.inspect.gsub(/^/, "  "),
      "Instead got:",
      decoded.inspect.gsub(/^/, "  "),
      "Encoded as:",
      encoded2.inspect.gsub(/^/, "  "),
    ].join("\n")
  end
end
