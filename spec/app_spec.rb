require 'spec_helper'
require 'rack/test'
require_relative '../app'

RSpec.describe Application do
    include Rack::Test::Methods

    let(:app) {Application.new}

    context "GET to root path(/)" do
        let(:response) {get "/"}

        it "returns status 200 OK" do
            expect(response.status).to eq 200
        end

        it "gets the root path" do
            expect(response.body).to include "hello world"
        end

    end
end