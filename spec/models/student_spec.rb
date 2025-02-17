# frozen_string_literal: true

require 'models/student'

describe Student do
  context '.say_hi' do
    it 'should only say hi' do
      expect(described_class.say_hi).to eq('hi')
    end
  end

  context '#say_hi' do
    it 'should present her/him with name' do
      subject.name = 'Jane' ## act
      expect(subject.say_hi).to eq('hi, i\'m Jane') ## assert
    end

    it 'should present her/him with default name' do
      expect(subject.say_hi).to eq('hi, i\'m Unknown')
    end
  end
end
