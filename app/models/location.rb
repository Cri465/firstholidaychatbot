class Location < ApplicationRecord
  def traits
    eval self[:traits]
  end

  def geodata
    eval self[:geodata]
  end

  def self.find_closest_match(traits)
    Location.select{|location| location.traits == traits }.map(&:id)
  end


end
