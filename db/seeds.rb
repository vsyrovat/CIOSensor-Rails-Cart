# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pcs, kg, m = Unit.create [{name: 'pcs'}, {name: 'kg'}, {name: 'm'}]
nail, rope, bucket = Good.create [{name: 'nail'}, {name: 'rope'}, {name: 'bucket'}]

Offer.create [
               {good: nail, unit: pcs, price: Money.from_cents(2, 'USD')},
               {good: nail, unit: kg, price: Money.from_cents(5_00, 'USD')},
               {good: rope, unit: m, price: Money.from_cents(25, 'USD')},
               {good: bucket, unit: pcs, price: Money.from_cents(10_00, 'USD')},
             ]
