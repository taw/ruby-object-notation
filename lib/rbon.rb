require "complex"
require "rational"
require "set"
require "time"

module RBON
  def self.encode(object)
    case object
    when Integer, String, Symbol, NilClass, TrueClass, FalseClass
      object.inspect
    when Float
      if object.finite?
        object.inspect
      elsif object.nan?
        "Float::NAN"
      elsif object.infinite?
        if object.positive?
          "Float::INFINITY"
        else
          "-Float::INFINITY"
        end
      else
        raise ArgumentError, "Don't know how to serialize #{object.inspect}"
      end
    when Range
      "#{encode(object.begin)}#{object.exclude_end? ? "..." : ".."}#{encode(object.end)}"
    when Array
      "[#{ object.map{|item| encode(item)}.join(", ") }]"
    when Hash
      "{#{ object.map{|key, value| "#{encode(key)} => #{encode(value)}"}.join(", ") }}"
    when Time
      "Time.iso8601(#{object.iso8601(10).inspect})"
    when Set
      "Set[#{ object.map{|item| encode(item)}.join(", ") }]"
    when Rational
      "Rational(#{encode(object.numerator)}, #{encode(object.denominator)})"
    when Complex
      "Complex(#{encode(object.real)}, #{encode(object.imag)})"
    else
      raise ArgumentError, "Don't know how to serialize #{object.class}"
    end
  end

  def self.decode(string)
    eval(string)
  end
end
