class Person < ActiveRecord::Base
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Accept only letters "}
end
