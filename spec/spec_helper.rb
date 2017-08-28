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
  match do |object|
    decoded = RBON.decode(RBON.encode(object))
    decoded.equal?(object) or decoded.eql?(object)
  end

  failure_message do |object|
    decoded = RBON.decode(RBON.encode(object))
    "Expected `#{object}' to survive RBON round trip:\n" +
      object.inspect.gsub(/^/, "  ") +
    "\nInstead got:\n" +
      decoded.inspect.gsub(/^/, "  ")
  end
end
