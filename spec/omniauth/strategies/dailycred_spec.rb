require 'spec_helper'

describe OmniAuth::Strategies::Dailycred do
  subject do
    OmniAuth::Strategies::Dailycred.new(nil, @options || {})
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:dailycred, {:id => '12345',
                              :email => 'Test@test.com',
                              :username => 'test',
                              :created => 45678,
                              :verified => false,
                              :admin => true,
                              :referred_by => 'dave' })

  it_should_behave_like 'an oauth2 strategy'
  
  
  describe '#client' do
      it 'should have the correct dailycred site' do
        subject.client.site.should eq("https://www.dailycred.com")
      end
      it 'should have the correct authorization url' do
        subject.client.options[:authorize_url].should eq("/oauth/authorize")
      end
      
      it 'should have the correct token url' do
        subject.client.options[:token_url].should eq('/oauth/access_token')
      end
  end
  
  # describe 'getting info' do
  #   before do
  #     @access_token = double("token" => 'test_token')
  #     @dailycred_user  = double( "id" => '12345',
  #                             "email" => 'Test@test.com',
  #                             "username" => 'test',
  #                             "created" => 45678,
  #                             "verified" => false,
  #                             "admin" => true,
  #                             "referred_by" => 'dave' )

  #     subject.stub(:access_token) { @access_token }

  #     @dailycred_user.should_receive(:fetch).and_return(@dwolla_user)
  #   end

  #   it 'set the correct info based on user' do
  #     subject.info.should == {:id => '12345',
  #                             :email => 'Test@test.com',
  #                             :username => 'test',
  #                             :created => 45678,
  #                             :verified => false,
  #                             :admin => true,
  #                             :referred_by => 'dave' }
  #   end

  #   it 'set the correct uid based on user' do
  #     subject.uid.should == '12345'
  #   end
  # end
end