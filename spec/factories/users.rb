FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :user do
    name { 'araba' }
    email { "aaa@amail.com" }
    password { "1111pppp" }
    password_confirmation { '1111pppp' }
    admin { "一般" }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :admin, class: User do
    name { 'machiko' }
    email { "aaa@jmail.com" }
    password { "1111qqqq" }
    password_confirmation { '1111qqqq' }
    admin { "管理者" }
  end
en
