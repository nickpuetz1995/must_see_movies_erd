require "rails_helper"

RSpec.describe "crews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/crews/#{crew.id}", payload
  end

  describe "basic update" do
    let!(:crew) { create(:crew) }

    let(:payload) do
      {
        data: {
          id: crew.id.to_s,
          type: "crews",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CrewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { crew.reload.attributes }
    end
  end
end
