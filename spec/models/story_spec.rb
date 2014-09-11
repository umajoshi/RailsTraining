require 'rails_helper'

RSpec.describe Story, :type => :model do
before (:each) { Story.delete_all}

subject do

	Story.new(
		:author => 'Bob',
		:title => 'Hello World',
		:url	=> 'https://example.com',
		:description => 'Desc...',
		)
end

	it 'should be able to create valid stories' do
		expect(subject.save).to.be true
	end

	it 'should ignore any url changes' do
		subject.save!

		subject.url = 'http://google.com'
		subject.save!
		expect(Story.last.url).to eql 'https://example.com'
	end

end
