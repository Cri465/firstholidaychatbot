class Location < ApplicationRecord
  def traits
    eval self[:traits]
  end

  def geodata
    eval self[:geodata]
  end

  def self.find_closest_match(traits)
    return Location.select{|location| location.traits == traits }.map(&:id) if Location.select{|location| location.traits == traits }.map(&:id).count.positive?
    Location.select{|location| (location.traits & traits).count == 2 }.map(&:id)
  end
end
