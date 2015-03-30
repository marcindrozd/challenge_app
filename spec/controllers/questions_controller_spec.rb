require 'spec_helper'

describe QuestionsController do
  context "user is the question owner" do
    it "updates the question" do
      alice = create(:user)
      sign_in alice
      question = create(:question, user: alice)
      post :update, id: question.id, question: { title: "This is new title", contents: question.contents }
      expect(Question.first.title).to eq("This is new title")
    end
  end

  context "user is not the owner of the question" do
    it "does not allow non-owner to edit the question" do
      alice = create(:user)
      bob = create(:user)
      sign_in alice
      question = create(:question, title: "Old title", user: bob)
      post :update, id: question.id, question: { title: "This is new title", contents: question.contents }
      expect(Question.first.title).to eq("Old title")
    end

    it "flashes the error message" do
      alice = create(:user)
      bob = create(:user)
      sign_in alice
      question = create(:question, title: "Old title", user: bob)
      post :update, id: question.id, question: { title: "This is new title", contents: question.contents }
      expect(flash[:error]).to be_present
    end
  end
end
