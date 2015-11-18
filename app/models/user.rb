class User < ActiveRecord::Base
  include Identity::Mixins::User
  
end
