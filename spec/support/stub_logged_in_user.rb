def stub_logged_in_user(user)
  allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
end