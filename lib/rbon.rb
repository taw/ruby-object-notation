module RBON
  # Decoding hacks
  NaN = Float::NAN
  Infinity = Float::INFINITY

  def self.encode(object)
    case object
    when Integer, Float, String, Symbol, NilClass, TrueClass, FalseClass
      object.inspect
    when Range
      "#{encode(object.begin)}#{object.exclude_end? ? "..." : ".."}#{encode(object.end)}"
    when Array
      "[#{ object.map{|item| encode(item)}.join(", ") }]"
    when Hash
      "{#{ object.map{|key, value| "#{encode(key)} => #{encode(value)}"}.join(", ") }}"
    else
      raise ArgumentError, "Don't know how to serialize #{object.class}"
    end
  end

  def self.decode(string)
    eval(string)
  end
end
