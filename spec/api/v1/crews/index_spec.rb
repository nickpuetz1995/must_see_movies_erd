require "rails_helper"

RSpec.describe "crews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/crews", params: params
  end

  describe "basic fetch" do
    let!(:crew1) { create(:crew) }
    let!(:crew2) { create(:crew) }

    it "works" do
      expect(CrewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["crews"])
      expect(d.map(&:id)).to match_array([crew1.id, crew2.id])
    end
  end
end
