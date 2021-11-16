require "rails_helper"

RSpec.describe "casts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/casts/#{cast.id}", payload
  end

  describe "basic update" do
    let!(:cast) { create(:cast) }

    let(:payload) do
      {
        data: {
          id: cast.id.to_s,
          type: "casts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CastResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { cast.reload.attributes }
    end
  end
end
