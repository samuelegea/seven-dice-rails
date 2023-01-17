require 'json'
def create_spells!
  puts "Creating spells"
  spells = JSON.parse(File.read('db/sources/5e-SRD-Spells.json'))

  spells.each do |spell|
    next if Spell.find_by(name: spell['name'])

    puts "Creating #{spell['name']}"

    Spell.create!(
      name: spell['name'],
      description: spell['desc']&.join(', ') || '',
      components: spell['components'].join(''),
      level: spell['level'].to_i,
      duration_qtd: parse_duration(spell['duration']).first,
      duration_type: parse_duration(spell['duration']).last,
      casting_time_qtd: spell['casting_time'].split(' ')[0].to_i,
      casting_time_type: spell['casting_time'].split(' ')[1..].join(''),
      range: parse_range(spell['range']).first,
      range_type: parse_range(spell['range']).last,
      area_of_effect_type: spell.dig('area_of_effect', 'type'),
      area_of_effect_size: spell.dig('area_of_effect', 'size'),
      school: spell['school']['name'].downcase,
      material: spell['material'] || '',
      ritual: spell['ritual'] || false,
      concentration: spell['concentration'] || false,
      details: {
        higher_levels: spell['higher_level']&.join(', ') || '',
      },
      # classes and subclasses
    )
  end
  puts 'Finished creating all the spells'
  puts "#{'*----' * 15}*"
end

def parse_duration(duration)
  return [0, 'instantaneous'] if duration == 'Instantaneous'
  return [0, 'until_dispelled'] if duration == 'Until dispelled'
  return [0, 'duration_special'] if duration == 'Special'

  duration = duration.gsub('Up to', '').strip if duration.include? 'Up to'

  [duration.split(' ').first.to_i, duration.split(' ').last.pluralize]
end

def parse_range(range)
  return [0, 'self'] if range == 'Self'
  return [0, 'touch'] if range == 'Touch'
  return [0, 'unlimited'] if range == 'Unlimited'
  return [0, 'sight'] if range == 'Sight'
  return [0, 'range_special'] if range == 'Special'

  range = range.gsub('Up to', '').strip if range.include? 'Up to'

  [range.split(' ').first.to_i, range.split(' ').last.pluralize]
end
