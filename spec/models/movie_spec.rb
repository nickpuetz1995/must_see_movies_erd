require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Direct Associations" do
    it { should have_many(:bookmarks) }

    it { should have_many(:reviews) }

    it { should have_many(:crews) }

    it { should have_many(:casts) }
  end

  describe "InDirect Associations" do
    it { should have_many(:actors) }

    it { should have_many(:directors) }
  end

  describe "Validations" do
  end
end
