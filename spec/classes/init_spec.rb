require 'spec_helper'

describe 'profiled' do
  context 'with defaults for all parameters' do
    it { should compile.with_all_deps }
    it { should contain_file('/etc/profile.d') }
  end
end
