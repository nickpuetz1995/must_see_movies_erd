require "rails_helper"

RSpec.describe "casts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/casts", params: params
  end

  describe "basic fetch" do
    let!(:cast1) { create(:cast) }
    let!(:cast2) { create(:cast) }

    it "works" do
      expect(CastResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["casts"])
      expect(d.map(&:id)).to match_array([cast1.id, cast2.id])
    end
  end
end
