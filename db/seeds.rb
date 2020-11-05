# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "... Starting seeds"
puts "... Erase all database"
RefWorkout.destroy_all
RefBlock.destroy_all
RefExercice.destroy_all
Workout.destroy_all
Block.destroy_all
Exercice.destroy_all
Base.destroy_all
HealthData.destroy_all
Meal.destroy_all
DaySession.destroy_all
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

jj = Base.create!(name: "Jumping Jack", base_type: "Effort", muscular_group: "full-body")
dips = Base.create!(name: "Dips", base_type: "Effort", muscular_group: "mix haut")
p1 = Base.create!(name: "Pompes serrées", base_type: "Effort", muscular_group: "pecs")
p2 = Base.create!(name: "Pompes larges", base_type: "Effort", muscular_group: "pecs")
t1 = Base.create!(name: "Tractions Supination", base_type: "Effort", muscular_group: "dos")
t2 = Base.create!(name: "Tractions Pronation", base_type: "Effort", muscular_group: "dos")


puts "   => Created 5 exercice bases"
puts "... Creating RefExercices"

puts "... // Creating 90s Jumping Jack"
  jj_90s = RefExercice.create!(
    name: "5 #{jj.name}",
    base: jj,
    ref_exercice_type: "timer",
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
    )
puts "... => 90s jumping jack created"

puts "... // Creating dips_6x5"
i = 1
dips_6x5 = []
6.times do
  dips_x5 = RefExercice.create!(
    name: "5 #{dips.name} - #{i}/6",
    base: dips,
    ref_exercice_type: "reps",
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
  dips_6x5 << dips_x5
  i += 1
end
puts "... => dips_6x5 created"

puts "... // Creating p1_6x5"
i = 1
p1_6x5 = []
6.times do
  p1_x5 = RefExercice.create!(
    name: "5 #{p1.name} - #{i}/6",
    base: p1,
    ref_exercice_type: "reps",
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
  p1_6x5 << p1_x5
  i += 1
end
puts "... => p1_6x5 created"

puts "... // Creating p2_6x5"
i = 1
p2_6x5 = []
6.times do
  p2_x5 = RefExercice.create!(
    name: "5 #{p2.name} - #{i}/6",
    base: p2,
    ref_exercice_type: "reps",
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
  p2_6x5 << p2_x5
  i += 1
end
puts "... => p2_6x5 created"

puts "... // Creating t1_6x5"
i = 1
t1_6x5 = []
6.times do
  t1_x5 = RefExercice.create!(
    name: "5 #{t1.name} - #{i}/6",
    base: t1,
    ref_exercice_type: "reps",
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
  t1_6x5 << t1_x5
  i += 1
end
puts "... => t1_6x5 created"

puts "... // Creating t2_6x5"
i = 1
t2_6x5 = []
6.times do
  t2_x5 = RefExercice.create!(
    name: "5 #{t2.name} - #{i}/6",
    base: t2,
    ref_exercice_type: "reps",
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
  t2_6x5 << t2_x5
  i += 1
end
puts "... => t2_6x5 created"

puts "... Creating 2 Ref_blocks : Poitrine and Dos"
block_poitrine = RefBlock.create!(
  name: "Block Poitrine",
  ref_workout_id: nil,
  index_in_workout: nil,
  time_delay_next: 180000,
  user: sam
  )
block_dos = RefBlock.create!(
  name: "Block Dos",
  ref_workout_id: nil,
  index_in_workout: nil,
  time_delay_next: 0,
  user: sam
  )

exo_poitrine = [dips_6x5, p1_6x5, p2_6x5]
puts "... Adding  dips_6x5, p1_6x5 and p2_6x5 to Ref_block Poitrine"
exo_poitrine.each do |mini_block|
  i = 1
  mini_block.each do |exo|
    exo.ref_block = block_poitrine
    index_in_block = i
    i += 1
  end
end

puts "... Adding  t1_6x5 and t2_6x5to Ref_block Dos"
exo_dos = [t1_6x5, t2_6x5]
exo_dos.each do |mini_block|
  i = 1
  mini_block.each do |exo|
    exo.ref_block = block_dos
    index_in_block = i
    i += 1
  end
end
puts "   => Created 2 blocks : Poitrine and Dos"

puts "... Creating 1 Ref_workout : EPP Poitrine Dos"
ref_epp = RefWorkout.create!(name: "EPP 1/2 : Poitrine Dos", user: sam)
jj_90s.ref_workout = ref_epp
jj_90s.index_in_workout = 1
block_poitrine.ref_workout = ref_epp
block_poitrine.index_in_workout = 2
block_dos.ref_workout = ref_epp
block_dos.index_in_workout = 3
puts "   => Created 1 Ref_workout : #{ref_epp.name}"
