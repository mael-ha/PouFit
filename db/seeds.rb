# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "... Starting seeds"
puts "... Erase all database"
Ref_workout.destroy_all
Ref_block.destroy_all
Ref_exercise.destroy_all
Workout.destroy_all
Block.destroy_all
Exercise.destroy_all
Base.destroy_all
Health_data.destroy_all
Meal.destroy_all
Day_session.destroy_all
User.destroy_all


# Create User
puts "... Creating 1 user"
sam = User.create!(
  first_name: "Sam",
  last_name: "Sam",
  username: "Samsam",
  birthdate: Date.new(1994,5,15),
  gender: "Femme",
  email: "samsam@poufit.com",
  password: "poufit"
  )
puts "   => Created User ##{sam.id} - username: #{sam.username}"

puts "... Creating 6 exercice bases"

jj = Base.create!(name: "Jumping Jack", type: "Effort", muscular_group: "full-body")
dips = Base.create!(name: "Dips", type: "Effort", muscular_group: "mix haut")
p1 = Base.create!(name: "Pompes serrées", type: "Effort", muscular_group: "pecs")
p2 = Base.create!(name: "Pompes larges", type: "Effort", muscular_group: "pecs")
t1 = Base.create!(name: "Tractions Supination", type: "Effort", muscular_group: "dos")
t2 = Base.create!(name: "Tractions Supination", type: "Effort", muscular_group: "dos")


puts "   => Created exercice bases: #{Base.all.each { |base| puts "#{base.name}" }}"
puts "... Creating Ref_exercices"

puts "... // Creating 90s Jumping Jack"
  90sjj = Ref_exercice.create!(
    name: "5 #{jj.name} - #{i}/6",
    base: jj,
    type: "timer",
    timer: 90000,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{jj.name} crossfit",
    time_delay_next: 120000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
puts "... => 90s jumping jack created"

puts "... // Creating 6x5dips"
i = 1
6x5dips = []
6.times do
  5dips = Ref_exercice.create!(
    name: "5 #{dips.name} - #{i}/6",
    base: dips,
    type: "reps",
    timer: nil,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{dips.name} full amplitude",
    time_delay_next: 25000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
    )
  6x5dips << 5dips
  i += 1
end
puts "... => 6x5dips created"

puts "... // Creating 6x5p1"
i = 1
6x5p1 = []
6.times do
  5p1 = Ref_exercice.create!(
    name: "5 #{p1.name} - #{i}/6",
    base: p1,
    type: "reps",
    timer: nil,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{p1} full amplitude, au sol, non surélevé",
    time_delay_next: 25000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
    )
  6x5p1 << 5p1
  i += 1
end
puts "... => 6x5p1 created"

puts "... // Creating 6x5p2"
i = 1
6x5p2 = []
6.times do
  5p2 = Ref_exercice.create!(
    name: "5 #{p2.name} - #{i}/6",
    base: p2,
    type: "reps",
    timer: nil,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{p2} full amplitude, au sol, non surélevé",
    time_delay_next: 25000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
    )
  6x5p2 << 5p2
  i += 1
end
puts "... => 6x5p2 created"

puts "... // Creating 6x5t1"
i = 1
6x5t1 = []
6.times do
  5t1 = Ref_exercice.create!(
    name: "5 #{t1.name} - #{i}/6",
    base: t1,
    type: "reps",
    timer: nil,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{t1} full amplitude, au sol, non surélevé",
    time_delay_next: 25000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
    )
  6x5t1 << 5t1
  i += 1
end
puts "... => 6x5t1 created"

puts "... // Creating 6x5t2"
i = 1
6x5t2 = []
6.times do
  5t2 = Ref_exercice.create!(
    name: "5 #{t2.name} - #{i}/6",
    base: t2,
    type: "reps",
    timer: nil,
    number_of_reps: 6,
    weight_value: 0,
    comment: "#{t2} full amplitude, au sol, non surélevé",
    time_delay_next: 25000,
    user: sam,
    index_in_block: nil,
    index_in_workout: nil,
    ref_block_id: nil,
    ref_workout_id: nil
    )
  6x5t2 << 5t2
  i += 1
end
puts "... => 6x5t2 created"

puts "... Creating 2 Ref_blocks : Poitrine and Dos"
block_poitrine = Block.create!(
  name: "Block Poitrine",
  ref_workout_id: nil,
  index_in_workout: nil,
  time_delay_next: 180000,
  user: sam
  )
block_dos = Block.create!(
  name: "Block Dos",
  ref_workout_id: nil,
  index_in_workout: nil,
  time_delay_next: 0,
  user: sam
  )

exo_poitrine = [6x5dips, 6x5p1, 6x5p2]
puts "... Adding  6x5dips, 6x5p1 and 6x5p2 to Ref_block Poitrine"
exo_poitrine.each do |mini_block|
  i = 1
  mini_block.each do |exo|
    exo.ref_block = block_poitrine
    index_in_block = i
    i += 1
  end
end

puts "... Adding  6x5t1 and 6x5t2to Ref_block Dos"
exo_dos = [6x5t1, 6x5t2]
exo_dos.each do |mini_block|
  i = 1
  mini_block.each do |exo|
    exo.ref_block = block_dos
    index_in_block = i
    i += 1
  end
end
puts "   => Created 2 blocks : Poitrine and Dos"
