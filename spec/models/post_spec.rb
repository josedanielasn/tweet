require 'rails_helper'

RSpec.describe Post, type: :model do
  context "when validated" do
    context "when post is valid" do
      let(:post) { build(:post) }

      it { expect(post).to be_valid }
    end

    context "when message of post is invalid" do
      let(:post1) { build(:post, message: nil)}
      let(:post2) { build(:post, message: "1" * 281)}

      it { expect(post1).not_to be_valid }
      it { expect(post2).not_to be_valid }
    end
    
    
  end
  
end
