require 'models/user.rb'

RSpec.describe User do
  before(:each) do
    @user = User.new('Dennis', 'dennisgabriel@email.com', 22)
  end

  before(:all) do
    puts 'Iniciando testes'
  end

  describe '#initialize' do
    it 'create a user with name, email, age' do
      expect(@user.name).to eq 'Dennis'
      expect(@user.email).to eq 'dennisgabriel@email.com'
      expect(@user.age).to eq 22
    end
  end

  describe '#adult?' do
    it 'be an adult?' do
      expect(@user.adult?).to be true
    end

    context 'when user is under 18' do
      before do
        @minor = User.new('Gabriel', 'gabrielzin@email.com', 15)
      end

      it 'returns false' do
        expect(@minor.adult?).to be false
      end
    end
  end

  describe '#greeting' do
    it 'personalized greeting' do
      expect(@user.greeting).equal?('Hello, Dennis!')
    end

    it 'includes user name' do
      expect(@user.greeting).to include(@user.name)
    end
  end

  describe '#change_email' do
    it 'updates the email' do
      old_email = @user.email
      new_email = 'dennisnew@tor.com'
      @user.change_email(new_email)
      expect(@user.email).equal?(new_email)
    end

    it 'invalid email' do
      old_email = @user.email
      new_email = 'dennisnew.com'
      expect { @user.change_email(new_email) }.to raise_error(ArgumentError)
    end
  end
end
