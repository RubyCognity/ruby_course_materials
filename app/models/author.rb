class Author < ApplicationRecord 
    PHONE_REGEXP = /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{3}/
    ## Associations 
    has_many :posts, dependent: :nullify
    ## Validations
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates_format_of :phone_number, with: PHONE_REGEXP, message: 'Phone number should be in xxx-xxx-xxx format'

    def full_name 
        "#{self.first_name} #{last_name}"
    end
end
