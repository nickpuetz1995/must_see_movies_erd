require "rails_helper"

RSpec.describe Crew, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:director) }

    it { should belong_to(:movie) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
