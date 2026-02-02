require 'rails_helper'

RSpec.describe Track, type: :model do
  describe 'associations' do
    it { should have_many(:units).dependent(:destroy) }
    it { should have_many(:lessons).through(:units) }
    it { should have_many(:user_track_progresses).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:track) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:slug) }

    it 'requires slug if name is blank' do
      track = Track.new(name: nil, slug: nil)
      expect(track).not_to be_valid
      expect(track.errors[:name]).to include("can't be blank")
    end
  end

  describe 'scopes' do
    let!(:published_track) { create(:track, published: true, position: 1) }
    let!(:unpublished_track) { create(:track, published: false, position: 0) }

    describe '.published' do
      it 'returns only published tracks' do
        expect(Track.published).to include(published_track)
        expect(Track.published).not_to include(unpublished_track)
      end
    end

    describe '.ordered' do
      it 'returns tracks ordered by position' do
        expect(Track.ordered.first).to eq(unpublished_track)
      end
    end
  end

  describe '#generate_slug' do
    it 'generates slug from name on create' do
      track = Track.create!(name: 'Novo Testamento')
      expect(track.slug).to eq('novo-testamento')
    end
  end

  describe '#total_lessons' do
    let(:track) { create(:track) }
    let(:unit) { create(:unit, track: track) }

    before do
      create_list(:lesson, 3, unit: unit)
    end

    it 'returns the total number of lessons' do
      expect(track.total_lessons).to eq(3)
    end
  end
end
