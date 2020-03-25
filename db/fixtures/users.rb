# db/fixtures/users.rb
User.seed(:email,
  {:email=> 'a@test.com', :username=> 'test1', :password=> 'test', :password_confirmation=> 'test'},
  {:email=> 'b@test.com', :username=> 'test2', :password=> 'test', :password_confirmation=> 'test'},
  {:email=> 'c@test.com', :username=> 'test3', :password=> 'test', :password_confirmation=> 'test'}
 )
