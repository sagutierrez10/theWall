class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true, length: {minimum: 5}

    has_many :messages
end
