require "rails_helper"

RSpec.describe CastResource, type: :resource do
  describe "serialization" do
    let!(:cast) { create(:cast) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cast.id)
      expect(data.jsonapi_type).to eq("casts")
    end
  end

  describe "filtering" do
    let!(:cast1) { create(:cast) }
    let!(:cast2) { create(:cast) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: cast2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([cast2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:cast1) { create(:cast) }
      let!(:cast2) { create(:cast) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      cast1.id,
                                      cast2.id,
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
                                      cast2.id,
                                      cast1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
