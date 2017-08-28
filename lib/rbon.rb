module RBON
  NaN = Float::NAN

  def self.encode(object)
    object.inspect
  end

  def self.decode(string)
    eval(string)
  end
end
