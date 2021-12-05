# coding: utf-8
User.create!(
    :name => "hogehoge",
    :email => "hogehoge@gmail.com",
    :password => "hogehoge1234",
    :tall => 175.4 ,
    :birthday => "2000-01-01")

UserBodyComposition.create!(
    :user_id => "1",
    :weight => 67.2,
    :body_fat_rate => 23.4
)

Target.create!(
    :user_id => "1",
    :weight => 59.5,
    :body_fat_rate => 15.0,
    :daily_energy => 2000,
    :weight_limit => "2021-12-20",
    :body_fat_rate_limit => "2021-12-20"
)

#rails db:migrate:reset
#rails c
#> User.all
#> Target.find_by(user_id: 1)