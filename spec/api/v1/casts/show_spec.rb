require "rails_helper"

RSpec.describe "casts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/casts/#{cast.id}", params: params
  end

  describe "basic fetch" do
    let!(:cast) { create(:cast) }

    it "works" do
      expect(CastResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("casts")
      expect(d.id).to eq(cast.id)
    end
  end
end
