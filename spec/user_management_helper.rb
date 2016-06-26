def sign_up(username: "TestUser",
            email: "t@test.com",
            password: "Sup£rsecret",
            password_conf: "Sup£rsecret")
  visit "/"
  fill_in "Username", with: username
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password_conf
  click_button "Sign Up!"
end
