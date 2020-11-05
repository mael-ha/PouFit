puts "====================================== STARTING SEEDS ================================="
puts "... Erase all database"
WbeTable.destroy_all
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

puts "    // Creating 90s Jumping Jack"
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
    )
puts "      => 90s jumping jack created"

puts "    // Creating dips_6x5"
dips_x5 = RefExercice.create!(
  name: "5 #{dips.name}",
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
  )

puts "      => dips_x5 created"

puts "    // Creating p1_6x5"
p1_x5 = RefExercice.create!(
  name: "5 #{p1.name}",
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
  )
puts "      => p1_x5 created"

puts "    // Creating p2_6x5"
p2_x5 = RefExercice.create!(
  name: "5 #{p2.name}",
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
  )
puts "      => p2_x5 created"

puts "    // Creating t1_6x5"
t1_x5 = RefExercice.create!(
  name: "5 #{t1.name}",
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
  )
puts "      => t1_x5 created"

puts "    // Creating t2_6x5"
t2_x5 = RefExercice.create!(
  name: "5 #{t2.name}",
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
  )
puts "      => t2_x5 created"

puts "... Creating 2 Ref_blocks : Poitrine and Dos"
block_poitrine = RefBlock.create!(
  name: "Block Poitrine",
  index_in_workout: nil,
  time_delay_next: 180000,
  user: sam
  )
block_dos = RefBlock.create!(
  name: "Block Dos",
  index_in_workout: nil,
  time_delay_next: 0,
  user: sam
  )
puts "   => Created 2 blocks : Poitrine and Dos"

puts "... Creating 1 Ref_workout : EPP Poitrine Dos"
ref_workout_1 = RefWorkout.create!(name: "EPP 1/2 : Poitrine Dos", user: sam)
puts "   => Created 1 Ref_workout : #{ref_workout_1.name}"

puts "... Creating all WbeTable models"
exo_poitrine = [dips_x5, p1_x5, p2_x5]
i = 1
exo_poitrine.each do |exo|
  WbeTable.create!(
    ref_workout: nil,
    ref_block: block_poitrine,
    ref_exercice: exo,
    number_of_sets: 6
    )
  exo.index_in_block = i
  i += 1
end

exo_dos = [t1_x5, t2_x5]
i = 1
exo_dos.each do |exo|
  WbeTable.create!(
    ref_workout: nil,
    ref_block: block_dos,
    ref_exercice: exo,
    number_of_sets: 6
    )
  exo.index_in_block = i
  i += 1
end

WbeTable.create!(
  ref_workout: ref_workout_1,
  ref_block: nil,
  ref_exercice: jj_90s,
  number_of_sets: 1
  )

blocks = [block_poitrine, block_dos]
i = 1
blocks.each do |block|
  WbeTable.create!(
    ref_workout: ref_workout_1,
    ref_block: block,
    ref_exercice: nil,
    number_of_sets: 1
    )
  block.index_in_workout = i
  i += 1
end
puts "   => Created #{WbeTable.all.count} models linking to Ref_workout '#{ref_workout_1.name}'"
puts "====================================== SEEDS OK ======================================="
