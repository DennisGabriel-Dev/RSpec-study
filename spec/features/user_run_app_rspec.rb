# frozen_string_literal: true

require 'application'

describe Application do
  context '#call' do
    it 'should return hi' do
      expect(Application.new.call).to eq('hi')
    end
  end
end
