module RBON
  # Decoding hacks
  NaN = Float::NAN
  Infinity = Float::INFINITY

  def self.encode(object)
    object.inspect
  end

  def self.decode(string)
    eval(string)
  end
end
