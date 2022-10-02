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

        it "returns page content" do
            expect(response.body).to include "Wendo's Basic Work Timer"
        end
    end

    context "POST to root path(/)" do
        let(:response) {post "/"}
        it "starts new timer and sends back the starting time" do
            expect(response.body[start_time]).to be < Time.now
        end
    end

    context "GET to /recap" do
        it "navigates to work recap form page"
    end

    context "GET to /recap?id=[:id]" do
        it "navigates to work recap for that specific work item"
    end

    context "GET to /history" do
        it "navigates to history page"
    end

    context "POST to /history" do
        it "returns a list of previous work time"
    end
end