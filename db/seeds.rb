100.times do |i|
  Task.create!(
    name: "task#{i}",
    description: "desc#{i}"
  )
end
