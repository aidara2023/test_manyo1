FactoryBot.define do
  factory :task do
    title { 'Test1' }
    content { 'Test est ok' }
  end

  factory :second_task do
    title { 'Test2' }
    content { 'Test2 est ok' }
  end
  
end
