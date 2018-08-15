# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Case types
["Room case", "Audio case"].each do |type|
  CaseType.create(name: type)
end

# Cases
[1,2,3,4,5,6].each do |number|
  Case.create(name: "Case #{number}", number: number,
    case_type: CaseType.find_by(name: "Room case"))

  Case.create(name: "Audio case #{number}", number: number,
    case_type: CaseType.find_by(name: "Audio case"))
end

# Events
Event.create(
  name: "FrOSCon 2018",
  location: "St. Augustin",
  start_date: Date.parse("2018-08-25"),
  end_date: Date.parse("2018-08-26"),
  buildup: DateTime.parse("2018-08-24 10:00"),
  removel: DateTime.parse("2018-08-26 18:00")
)

# Items
Item.create(
  name: "Encoding Cube",
  case: Case.first,
  price: 1000,
  date_of_purchase: Date.parse("2014-05-01"),
  serial_number: "02656001-d69e-4d23-8d0f-1a36b7b1dd71"
)

Item.create(
  name: "Mixer Notebook",
  manufacturer: "Lenovo",
  model: "T420 L",
  case: Case.first,
  price: 800,
  date_of_purchase: Date.parse("2014-05-01"),
  serial_number: "7d9dc4bf-d9c6-4818-8ebd-138428b27a62"
)

Item.create(
  name: "Netzteil Mixer Notebook",
  case: Case.first,
  item: Item.find_by(case: Case.first, name: "Mixer Notebook")
)

Item.create(
  name: "Speaker-Adapter",
  case: Case.first
)

Item.create(
  name: "VGA → HDMI-Adapter",
  case: Case.first,
  item: Item.find_by(case: Case.first, name: "Speaker-Adapter")
)

Item.create(
  name: "DisplayPort → HDMI-Adapter",
  case: Case.first,
  item: Item.find_by(case: Case.first, name: "Speaker-Adapter")
)

Item.create(
  name: "USBC → HDMI-Adapter",
  case: Case.first,
  item: Item.find_by(case: Case.first, name: "Speaker-Adapter")
)
