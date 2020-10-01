class User < ApplicationRecord
    has_secure_password
    has_many :lists, dependent: :destroy
    validates :email, uniqueness: true

    def initialize(attributes={})
        super
        List.create(title: 'In Progress', description: "What I'm curently watching/reading/playing/etc", user: self)
        List.create(title: 'Completed', description: "Things I've finished", user: self)
    end

    def generate_password_token!
        self.password_token = generate_token
        save!
    end

    def password_token_valid?(token)
        self.password_token == token
    end

    def reset_password!(password)
        self.password_token = nil
        self.password = password
        save!
    end

    private

    def generate_token
        SecureRandom.alphanumeric(8)
    end
end
