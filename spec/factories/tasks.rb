FactoryBot.define do
  factory :task do
    task_name { 'task1' }
    task_description { 'desc1' }
    due_date { '2021-05-27' }
    status { 1 }
    priority { 0 }
  end
  factory :task2, class: Task do
    task_name { 'task2' }
    task_description { 'desc2' }
    due_date { '2021-05-27' }
    status { 1 }
    priority { 0 }
  end
  factory :task3, class: Task do
    task_name { 'task3' }
    task_description { 'desc3' }
    due_date { '2021-05-27' }
    status { 1 }
    priority { 0 }
  end
end
