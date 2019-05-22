require './lib/parser.rb'
require 'rspec'

RSpec.describe Parser do

    subject { described_class.new(argument[0]) }

    let(:argument) { ['fake.log'] }

    it 'runs' do
        subject.run
    end

    it 'prints out the lines' do
        expected_output = "1 /help_page/1 126.318.035.038" + "\n" +
        "2 /contact 184.123.665.067" + "\n" +
        "3 /home 184.123.665.067" + "\n" +
        "4 /about/2 444.701.448.104" + "\n" +
        "5 /help_page/1 929.398.951.889"
        expect { subject.run }.to output(expected_output).to_stdout
    end

    it 'shows number of visits for each pages, in descending order' do
        page_visits_output = 
        "/help_page/1 2 visits" + "\n" +
        "/home 1 visits" + "\n" +
        "/contact 1 visits" + "\n" +
        "/about/2 1 visits" + "\n"
        subject.run
        expect { subject.page_visits }.to output(page_visits_output).to_stdout
    end

end