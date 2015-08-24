# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create( name: 'Огурец', description: '', manufacturer: '', kind: 'food',
                calories: 13.5, fats: 0.1, proteins: 0.8, carbohydrates: 3.6,
                vitamin_a: 0.06, vitamin_b1: 0.03, vitamin_b2: 0.04,
                vitamin_b3: 0.3, vitamin_b4: 0, vitamin_b5: 0, vitamin_b6: 0.04,
                vitamin_b7: 0.004, vitamin_b9: 0, vitamin_b10: 0, vitamin_b11: 0,
                vitamin_b12: 0, vitamin_b13: 0, vitamin_b15: 0, vitamin_c: 10,
                vitamin_d: 0, vitamin_e: 0.1, vitamin_k: 0, vitamin_n: 0, vitamin_p: 0,
                vitamin_u: 0, calcium: 23, iron: 0.6, potassium: 141, copper: 0.1,
                manganese: 0.18, magnesium: 14, sodium: 8, sulfur: 0, silicon: 0,
                zinc: 0.215, selenium: 0, chrome: 0.006, iodine: 0.003 )
Product.create( name: 'Томат', description: '', manufacturer: '', kind: 'food',
                calories: 19.9, fats: 0.2, proteins: 0.6, carbohydrates: 4.2,
                vitamin_a: 0.2, vitamin_b1: 0.06, vitamin_b2: 0.04,
                vitamin_b3: 0, vitamin_b4: 0, vitamin_b5: 0.3, vitamin_b6: 0.1,
                vitamin_b7: 0, vitamin_b9: 0.011, vitamin_b10: 0, vitamin_b11: 0,
                vitamin_b12: 0, vitamin_b13: 0, vitamin_b15: 0, vitamin_c: 25,
                vitamin_d: 0, vitamin_e: 0.4, vitamin_k: 0.0079, vitamin_n: 0, vitamin_p: 0,
                vitamin_u: 0, calcium: 14, iron: 0.9, potassium: 290, copper: 0.11,
                manganese: 0.14, magnesium: 0, sodium: 40, sulfur: 0, silicon: 0,
                zinc: 0.2, selenium: 0.0004, chrome: 0.005, iodine: 0.002 )
