# coding: utf-8
User.where(:email => "hogehoge@gmail.com").first_or_create(
    :name => "hogehoge",
    :email => "hogehoge@gmail.com",
    :password => "hogehoge1234",
    :tall => 175.4 ,
    :birthday => "2000-01-01")

User.where(:email => "hogehoge2@gmail.com").first_or_create(
    :name => "hogehoge2",
    :email => "hogehoge2@gmail.com",
    :password => "hogehoge1234",
    :tall => 175.4 ,
    :birthday => "2000-01-01")


UserBodyComposition.where(:user_id => 1).first_or_create(
    :user_id => 1,
    :weight => 67.2,
    :body_fat_rate => 23.4
)

UserBodyComposition.where(:user_id => 2).first_or_create(
    :user_id => 2,
    :weight => 64.8,
    :body_fat_rate => 16.7
)

Target.where(:user_id => 1).first_or_create(
    :user_id => 1,
    :weight => 59.5,
    :body_fat_rate => 15.0,
    :daily_energy => 2000,
    :weight_limit => "2021-12-20",
    :body_fat_rate_limit => "2021-12-20"
)

Target.where(:user_id => 2).first_or_create(
    :user_id => 2,
    :weight => 60.0,
    :body_fat_rate => 15.0,
    :daily_energy => 2000,
    :weight_limit => "2022-01-17",
    :body_fat_rate_limit => "2022-01-17"
)

#rails db:migrate:reset
#rails c
#> User.all
#> Target.find_by(user_id: 1)