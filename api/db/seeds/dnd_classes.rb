require 'json'

def create_classes!
  puts "Creating classes"
  classes = JSON.parse(File.read('db/sources/5e-SRD-Classes.json'))

  classes.each do |class_name, class_data|
    next if CharacterClass.find_by(name: class_name)

    puts "Creating #{class_name}"
end