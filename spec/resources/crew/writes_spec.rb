require "rails_helper"

RSpec.describe CrewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "crews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CrewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Crew.count }.by(1)
    end
  end

  describe "updating" do
    let!(:crew) { create(:crew) }

    let(:payload) do
      {
        data: {
          id: crew.id.to_s,
          type: "crews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CrewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { crew.reload.updated_at }
      # .and change { crew.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:crew) { create(:crew) }

    let(:instance) do
      CrewResource.find(id: crew.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Crew.count }.by(-1)
    end
  end
end
