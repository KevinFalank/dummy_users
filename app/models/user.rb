class User < ActiveRecord::Base

  def self.authenticate(email, password)
    user = User.find_by email: email
    if user
      if user.password == password
        # puts "Yea! user authenticated"
        true
      else
        # puts "Go away!"
        false
      end
    else
      false
    end
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end

end
