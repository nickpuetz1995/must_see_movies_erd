require "rails_helper"

RSpec.describe "crews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/crews/#{crew.id}", params: params
  end

  describe "basic fetch" do
    let!(:crew) { create(:crew) }

    it "works" do
      expect(CrewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("crews")
      expect(d.id).to eq(crew.id)
    end
  end
end
