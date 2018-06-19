require "rails_helper"

RSpec.describe PlaysController, type: :controller do
  subject { post :create, params: params }

  let(:kingdom) { create(:kingdom) }
  let(:params) do
    {
      play: {
        kingdom_id: kingdom.id,
        number_of_players: number_of_players,
        rating: rating
      }
    }
  end

  let(:number_of_players) { 0 }
  let(:rating) { 0 }

  before { allow(controller).to receive(:render).and_call_original }

  context "with valid params" do
    let(:number_of_players) { (2..6).to_a.sample }
    let(:rating) { (1..5).to_a.sample }

    it "creates a play" do
      expect { subject }.to change(Play, :count).by(1)
    end

    it "redirects to kingdom_path" do
      subject
      expect(response).to redirect_to(kingdom_path(kingdom))
    end
  end

  context "with invalid params" do
    it "renders the kingdoms/show page" do
      subject
      expect(controller).to have_received(:render) do |view, options|
        expect(view).to eq("kingdoms/show")
        expect(options[:locals]).to match(hash_including(:kingdom, :play))
      end
    end
  end
end
