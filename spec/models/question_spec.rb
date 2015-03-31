require 'spec_helper'

describe Question do
  it { should validate_presence_of(:title) }

  describe "#has_accepted_answer?" do
    it "returns true if question has accepted answer" do
      alice = create(:user)
      question = create(:question, user: alice)
      answer = create(:answer, question: question, accepted: true)
      expect(question.has_accepted_answer?).to be_true
    end

    it "returns false if question does not have accepted answer" do
      alice = create(:user)
      question = create(:question, user: alice)
      answer = create(:answer, question: question, accepted: false)
      expect(question.has_accepted_answer?).to be_false
    end
  end
end
