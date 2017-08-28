
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
      end
    when Range
      "#{encode(object.begin)}#{object.exclude_end? ? "..." : ".."}#{encode(object.end)}"
    when Array
      "[#{ object.map{|item| encode(item)}.join(", ") }]"
    when Hash
      "{#{ object.map{|key, value| "#{encode(key)} => #{encode(value)}"}.join(", ") }}"
    when Time
      "Time.at(#{object.to_i}, #{object.nsec/1000.0})"
    when Set
      "Set[#{ object.map{|item| encode(item)}.join(", ") }]"
    else
      raise ArgumentError, "Don't know how to serialize #{object.class}"
    end
  end

  def self.decode(string)
    eval(string)
  end
end
