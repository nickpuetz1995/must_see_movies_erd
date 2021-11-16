require "rails_helper"

RSpec.describe "crews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/crews/#{crew.id}"
  end

  describe "basic destroy" do
    let!(:crew) { create(:crew) }

    it "updates the resource" do
      expect(CrewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Crew.count }.by(-1)
      expect { crew.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
