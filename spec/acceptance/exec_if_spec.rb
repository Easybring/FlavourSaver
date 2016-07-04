require 'tilt'
require 'flavour_saver'

describe 'Fixture: exec_if.hbs' do
  let(:context) { Struct.new(:value, :expected).new }
  let(:template) { File.expand_path('../../fixtures/exec_if.hbs', __FILE__) }
  subject { Tilt.new(template).render(context).gsub(/[\s\r\n]+/, ' ').strip }

  it 'renders correctly when given a name' do
    context.value = 'Alan'
    context.expected = 'Alan'
    subject.should == "Say hello to Alan."
  end

  it 'renders correctly when not given a name' do
    context.value = 'Alan'
    context.expected = 'John'
    subject.should == "Nobody to say hi to."
  end
end
