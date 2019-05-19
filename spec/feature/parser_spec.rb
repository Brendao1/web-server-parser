require './lib/parser.rb'
require 'rspec'

RSpec.describe Parser do

    subject { described_class.new(argument).run }

    let(:argument) { ['webserver.log'] }

    it 'runs' do
        subject
    end
end