require "rails_helper"

RSpec.describe CrewResource, type: :resource do
  describe "serialization" do
    let!(:crew) { create(:crew) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(crew.id)
      expect(data.jsonapi_type).to eq("crews")
    end
  end

  describe "filtering" do
    let!(:crew1) { create(:crew) }
    let!(:crew2) { create(:crew) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: crew2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([crew2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:crew1) { create(:crew) }
      let!(:crew2) { create(:crew) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      crew1.id,
                                      crew2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      crew2.id,
                                      crew1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
