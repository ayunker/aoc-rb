Dir["./lib/2023/*.rb"].each { |file| require file }

IRB.conf[:USE_AUTOCOMPLETE] = false
