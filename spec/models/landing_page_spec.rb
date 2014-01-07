require 'spec_helper'

describe LandingPage do
  describe "validations" do
    it { should validate_presence_of :owner }

    it { should validate_presence_of :url }
    it { should validate_uniqueness_of :url }

    it { should allow_value('website.com').for(:url) }
    it { should allow_value('www.website.com').for(:url) }
    it { should allow_value('launch.website.com').for(:url) }

    it { should_not allow_value('website.com/something').for(:url) }
    it { should_not allow_value('website').for(:url) } 
    
    it 'should validate case insensitive uniqueness' do
      create(:landing_page, url: 'website.com')
      expect(build(:landing_page, url: 'Website.com')).to_not be_valid
    end

    it 'should validate www.a.com and a.com as the same' do
      create(:landing_page, url: 'website.com')
      expect(build(:landing_page, url: 'www.website.com')).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to :owner }
  end
end
