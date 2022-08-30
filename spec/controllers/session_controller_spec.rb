require 'rails_helper'

RSpec.describe SessionController do
  it 'can create challenges correctly' do
    verifier = 'earndavmddszijilhxijfnpldgmonihzlzgopwkrjqticnhugoazjpuamycdbxch'
    challenge = 'NHuGywnd2NBtMQVa49INWhXDa9PK74VswpzrSbrsukI'

    expect(SessionController.new.create_challenge(verifier)).to eq challenge
  end
end
