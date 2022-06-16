class Helper 
  def self.valid_entry?(value, min, max)
    return value.is_a?(Integer) && value >= min && value <= max
  end

  def self.place_empty?(place)
    return place != "X" && place != "O"
  end
end