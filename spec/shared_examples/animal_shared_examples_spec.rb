require_relative '../../lib/shared_examples/dog'
require_relative '../../lib/shared_examples/domestic_animal'
require_relative '../../lib/shared_examples/cat'
require_relative '../../lib/shared_examples/lion'


RSpec.shared_examples "an animal" do
  it "has a name" do
    expect(subject.name).not_to be_nil
  end

  it "can make sound" do
    expect(subject).to respond_to(:make_sound)
  end

  it "returns sound as string" do
    expect(subject.make_sound).to be_a(String)
  end
end


RSpec.shared_examples "a domestic animal" do
  it_behaves_like "an animal"

  it "can be petted" do
    expect(subject).to respond_to(:pet)
  end

  it "becomes happy when petted" do
    initial_happiness = subject.happiness
    subject.pet
    expect(subject.happiness).to be > initial_happiness
  end
end


RSpec.describe Dog do
  subject { Dog.new("Rex") }

  it_behaves_like "a domestic animal"

  describe "#make_sound" do
    it "barks" do
      expect(subject.make_sound).to eq("Huf huf!")
    end
  end

  describe "#fetch" do
    it "can fetch a ball" do
      expect(subject.fetch("ball")).to eq("Rex fetched the ball!")
    end
  end
end

RSpec.describe Cat do
  subject { Cat.new("Whiskers") }

  it_behaves_like "a domestic animal"

  describe "#make_sound" do
    it "meows" do
      expect(subject.make_sound).to eq("Meow!")
    end
  end

  describe "#hunt" do
    it "can hunt a mouse" do
      expect(subject.hunt("mouse")).to eq("Whiskers caugh a mouse!")
    end
  end
end

RSpec.describe Lion do
  subject { Lion.new("Simba") }

  it_behaves_like "an animal"

  it "#make_sound" do
    expect(subject.make_sound).to eq("ROAR!")
  end

  it "#hunt" do
    expect(subject.hunt("fox")).to eq("Simba is hunting fox with the pack!")
  end
end
