
require './spec/spec_helper.rb'
describe 'wrong in rspec in rails' do
  it 'calls the wrong assert' do
    assert { 1 + 1 == 3}
  end
end

