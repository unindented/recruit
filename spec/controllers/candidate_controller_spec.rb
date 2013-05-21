require 'spec_helper'

describe CandidatesController do

  context 'GET /candidates/new' do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should_not set_the_flash }
  end

  context 'with an invalid candidate' do
    let(:candidate) do
      name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      {name: name}
    end

    context 'POST /candidates' do
      before do
        post :create, candidate: candidate
      end

      it { should respond_with(200) } # OK
      it { should set_the_flash[:error] }
    end

    context 'XHR POST /candidates' do
      before do
        xhr :post, :create, candidate: candidate, format: :json
      end

      it { should respond_with(422) } # Unprocessable Entity
    end
  end

  context 'with a valid candidate' do
    let(:candidate) do
      name  = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      email = Faker::Internet.email(name)
      {name: name, email: email}
    end

    context 'POST /candidates' do
      before do
        post :create, candidate: candidate
      end

      it { should respond_with(302) } # Found
      it { should set_the_flash[:success] }
    end

    context 'XHR POST /candidates' do
      before do
        xhr :post, :create, candidate: candidate, format: :json
      end

      it { should respond_with(201) } # Created
    end
  end

end
