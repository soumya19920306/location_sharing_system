# db/fixtures/users.rb
User.seed(:email,
  {:email=> 'test1@test.com', :username=> 'test1', :password=> 'test', :password_confirmation=> 'test'},
  {:email=> 'test2@test.com', :username=> 'test2', :password=> 'test', :password_confirmation=> 'test'},
  {:email=> 'test3@test.com', :username=> 'test3', :password=> 'test', :password_confirmation=> 'test'},
  {:email=> 'test4@test.com', :username=> 'test4', :password=> 'test', :password_confirmation=> 'test'}
)
