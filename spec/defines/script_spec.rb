require 'spec_helper'

describe 'profiled::script' do
  context 'with title => bogus' do
    let(:title) { 'bogus' }
    it { should raise_error }
  end

  context 'with title => bogus and content => "echo bogus"' do
    let(:title) { 'bogus' }
    let(:params) { { :content => 'echo bogus' } }
    it { should compile.with_all_deps }
    it { should contain_file('/etc/profile.d/bogus') }
  end
end
