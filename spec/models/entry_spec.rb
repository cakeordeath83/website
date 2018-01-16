require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe Entry do
    describe "#create_slug" do
      it "creates a slug from the title" do
        entry = Entry.create(title: "My entry", description: "My description")
        entry.create_slug
        expect(entry.slug).to eq("my-entry")
      end
    end
    it "won't save without a title" do
      entry_without_title = Entry.create(title: "", description: "My description")
      expect(Entry.all.count).to eq(0)
    end
    it "won't save without a description" do
      entry_without_description = Entry.create(title: "My title", description: "")
      expect(Entry.all.count).to eq(0)
    end
  end
end
