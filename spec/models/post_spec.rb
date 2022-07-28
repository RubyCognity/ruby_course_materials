require 'rails_helper'

RSpec.describe Post, type: :model do 
    describe 'validators' do 
        it { should validate_presence_of(:content) }
        it { should validate_presence_of(:title) }
        it { should validate_uniqueness_of(:title) }
    end

    describe 'associations' do 
        it { should have_many(:categories_post) }
        it { should have_many(:categories).through(:categories_post) }
        it { should have_many(:comments).dependent(:destroy) }
    end
end
