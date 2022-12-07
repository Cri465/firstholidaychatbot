class Question

  ACTIVITY_QUESTIONS = [
    "Are you in the mood for relaxation or excitement?",
    "Do you want to take it easy or go on an adventure?",
    "Do you prefer a calm and peaceful experience or a thrilling and exciting one?",
    "Do you want to relax or do something more exciting?",
    "Do you want to sit back and unwind or go on a wild ride?",
    "Do you want to take a break and relax or keep the momentum going and go on an adventure?",
    "Do you want to chill out or get your adrenaline pumping?",
    "Do you want to relax and de-stress or do something more exhilarating?",
    "Do you want to unwind or have a more exciting experience?",
    "Do you want to relax or go on an adventure and explore?"
  ]
  CLIMATE_QUESTIONS = [
    "What kind of climate are you looking for on your holiday?",
    "Are you interested in a hot, mild, or cold destination for your vacation?",
    "Would you prefer a warm, temperate, or chilly climate for your holiday?",
    "Do you want to go on a holiday to a hot, moderate, or cold destination?",
    "Are you looking for a destination with a hot, mild, or cold climate for your vacation?",
    "Do you want to go on a holiday to a hot, comfortable, or cold destination?",
    "Are you looking for a destination with a hot, temperate, or cold climate for your vacation?",
    "Do you want to go on a holiday to a hot, pleasant, or cold destination?",
    "Are you looking for a destination with a hot, moderate, or cold climate for your vacation?",
    "Do you want to go on a holiday to a hot, temperate, or cold destination?",
  ]
  LOCATION_QUESTIONS = [
    "Which type of destination do you prefer: mountainous, city, or seaside?",
    "Which type of location would you like to visit: mountains, city, or beach?",
    "Are you looking for a vacation in the mountains, city, or by the sea?",
    "Do you want to go to a mountainous region, city, or coastal area for your vacation?",
    "Are you interested in a mountain retreat, city escape, or seaside vacation?",
    "Do you prefer a vacation in the mountains, city, or near the ocean?",
    "Would you rather go to a mountainous destination, city, or coastal town?",
    "Are you interested in exploring the mountains, city, or beach for your vacation?",
    "Do you want to go to a mountain resort, city destination, or seaside village for your vacation?",
    "Are you looking for a vacation in a mountain region, city, or by the sea?",
  ]
  ACTIVITY_LAZY_RESPONSES = [
    "Time to unwind, excellent",
    "A lazy holiday sounds like the perfect way to relax and unwind",
    "Many people enjoy taking a break from their busy lives and just lounging on their vacation",
    "A lazy holiday can be a great opportunity to catch up on some much needed rest and relaxation",
    "Some people prefer to take it easy on their vacation and just enjoy the scenery",
    "A lazy holiday can be a great way to recharge and refresh after a busy period",
    "Many people find that a slow-paced vacation helps them to de-stress and unwind",
    "A lazy holiday can be a great way to disconnect from the hustle and bustle of daily life",
    "Some people enjoy taking a break from their usual routine and just enjoying the simple pleasures of life",
    "A lazy holiday can provide a much needed break from the demands of work and everyday life",
    "Many people find that a low-key vacation helps them to relax and rejuvenate"
  ]
  ACTIVITY_ACTIVE_RESPONSES = [
    "Adventurer! Very good",
    "Great choice! An active holiday can provide many benefits, such as improved physical fitness, reduced stress, and increased happiness. Plus, it's a great way to see new places and have unique experiences",
    "Fantastic! An active holiday is a great way to have fun and stay healthy. From hiking and biking to water sports and more, there are many exciting options to choose from. Whatever your interests and fitness level, you'll be sure to find something that's right for you",
    "Awesome! An active holiday can be a fun and rewarding experience. Whether you're looking to try new sports or activities, or just want to explore new places and challenge yourself, there are many options to choose from",
    "That's wonderful! An active holiday is a great way to get out of your comfort zone and try new things. Whether you're a seasoned athlete or just looking for a fun way to stay active, there's something for everyone",
    "Great! An active holiday can be a great way to connect with nature and enjoy the outdoors. From hiking and camping to water sports and more, there are many exciting options to choose from",
    "Sounds like you're someone who likes to stay active and have fun! There are many different destinations that offer active holiday options, so you'll be sure to find something that fits your interests",
    "That's fantastic! An active holiday can be a great way to explore new places and challenge yourself. Whether you prefer hiking through the mountains or trying a new water sport, there's something for everyone",
    "Awesome! An active holiday is a great way to stay healthy and fit, while also experiencing new things and having fun",
    "Great choice! An active holiday can provide many benefits, such as improved physical fitness, reduced stress, and increased happiness. Plus, it's a great way to see new places and have unique experiences",
    "Fantastic! There are many different options for active holidays, so you'll be sure to find something that suits your interests and fitness level. From hiking and biking to water sports and more, the possibilities are endless"
  ]
  CLIMATE_HOT_RESPONSES = [
    "Sounds like you're looking for a warm destination!",
    "A hot climate is a great choice for a vacation",
    "It's always nice to escape to a warm place during the colder months",
    "A hot climate can offer plenty of sunny days and beautiful beaches",
    "Many people enjoy the heat and relaxation of a hot holiday destination",
    "Going to a hot climate can be a great way to unwind and relax",
    "A hot destination can offer a variety of activities and attractions",
    "Many people enjoy the warmth and sunshine of a hot climate for their vacation",
    "A hot holiday destination can be a great choice for a fun and relaxing getaway",
    "A hot climate can provide the perfect escape from the cold and dreary weather"
  ]
  CLIMATE_MILD_RESPONSES = [
    "A mild or warm climate is a great choice for a holiday",
    "Many people enjoy the comfortable temperatures of a mild or warm destination",
    "A mild or warm climate can offer a variety of activities and attractions",
    "Many people find that a mild or warm climate is perfect for a relaxing vacation",
    "A mild or warm destination can provide a great escape from the cold weather",
    "Many people enjoy the pleasant temperatures and sunshine of a mild or warm climate",
    "A mild or warm climate can be a great choice for a fun and enjoyable vacation",
    "Many people find that a mild or warm destination is perfect for unwinding and relaxing",
    "A mild or warm climate can offer a variety of outdoor activities and beautiful scenery",
    "Many people enjoy the comfortable and pleasant weather of a mild or warm climate for their vacation",
  ]
  CLIMATE_COLD_RESPONSES = [
    "A cold climate can be a great choice for a holiday",
    "Many people enjoy the crisp, fresh air of a cold destination",
    "A cold climate can offer a variety of winter activities and attractions",
    "Many people find that a cold climate is perfect for a rejuvenating vacation",
    "A cold destination can provide a great escape from the warm weather",
    "Many people enjoy the refreshing temperatures and snow of a cold climate",
    "A cold climate can be a great choice for a fun and adventurous vacation",
    "Many people find that a cold destination is perfect for experiencing new and exciting activities",
    "A cold climate can offer beautiful landscapes and scenic views",
    "Many people enjoy the cool and refreshing weather of a cold climate for their vacation"
  ]
  
  def self.random_question(traits)
    eval("#{traits.keys.sample.to_s}_questions".upcase).sample
  end

  def self.activity_question
    ACTIVITY_QUESTIONS.sample
  end

  def self.activity_response(intent)
    ACTIVITY_ACTIVE_RESPONSES.sample if intent == "activity_active"
    ACTIVITY_LAZY_RESPONSES.sample if intent == "activity_lazy"
  end

  def self.climate_response(intent)
    CLIMATE_HOT_RESPONSES.sample if intent == "climate_hot"
    CLIMATE_MILD_RESPONSES.sample if intent == "climate_mild"
    CLIMATE_COLD_RESPONSES.sample if intent == "climate_cold"
  end

  def self.setting_response(intent)
  end

end
