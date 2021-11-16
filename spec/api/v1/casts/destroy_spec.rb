require "rails_helper"

RSpec.describe "casts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/casts/#{cast.id}"
  end

  describe "basic destroy" do
    let!(:cast) { create(:cast) }

    it "updates the resource" do
      expect(CastResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Cast.count }.by(-1)
      expect { cast.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
