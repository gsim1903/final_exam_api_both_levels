require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :body }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :article }
    it { is_expected.to belong_to :user }
  end

end
