require 'spec_helper'

describe file('/etc/profile.d/blah') do
  its(:content) { should match /echo blah/ }
end
