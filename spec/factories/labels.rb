FactoryBot.define do
  factory :label do
    name { 'test' }
    # association :task
  end
  factory :second_label, class: Label do
    name { 'test2' }
    # association :task
  end
  factory :third_label, class: Label do
    name { 'test3' }
    # association :task
  end
end 