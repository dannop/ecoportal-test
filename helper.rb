class Helper 
  def self.validate_integer_entry(value, min, max)
    return value.is_a?(Integer) && value >= min && value <= max
  end
end