require 'rails_helper'

RSpec.describe Author, type: :model do 
    describe 'validators' do 
        it { should validate_presence_of(:first_name) }
        it { should validate_presence_of(:last_name) }
        it { should_not allow_value('554422423').for(:phone_number) }
    end

    describe 'associations' do 
        it { should have_many(:posts).dependent(:nullify) }
    end
end
