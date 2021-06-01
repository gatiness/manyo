FactoryBot.define do
  factory :task do
    name { 'task7' }
    description { 'desc7' }
    due_date { '2021-05-03' }
    status { 2 }
    priority { 1 }
  end
  factory :task2, class: Task do
    name { 'task5' }
    description { 'desc5' }
    due_date { '2021-06-09' }
    status { 1 }
    priority { 3 }
  end
  factory :task3, class: Task do
    name { 'task1' }
    description { 'desc1' }
    due_date { '2021-06-01' }
    status { 0 }
    priority { 3 }
  end
end
