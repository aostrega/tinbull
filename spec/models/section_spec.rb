require 'spec_helper'

describe Section do
  before do
    @section = FactoryGirl.build(:section)
  end

  subject { @section }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when name" do
    describe "is blank" do
      before { @section.name = " " }
      it { should_not be_valid }
    end

    describe "is longer than 16 characters" do
      before { @section.name = 'a'*17 }
      it { should_not be_valid }
    end

    describe "contains non-alphanumeric characters" do
      before { @section.name = 'foo_bar' }
      it { should_not be_valid }
    end

    describe "contains capital letters" do
      before { @section.name = 'fooBar' }
      it { should_not be_valid }
    end

    describe "already exists" do
      before do
        FactoryGirl.create(:section, name: 'winner')
        @section.name = 'winner'
      end
      it { should_not be_valid }
    end
  end
  
end
