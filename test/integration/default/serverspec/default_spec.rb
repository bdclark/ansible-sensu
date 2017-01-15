require 'spec_helper'

describe service("sensu-server") do
  it { should be_enabled }
  it { should be_running }
end

describe service("sensu-client") do
  it { should be_enabled }
  it { should be_running }
end

describe service("sensu-api") do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl --fail -s http://localhost:4567/clients/test-kitchen | jq -r .name') do
  its(:exit_status) { should eql 0 }
  its(:stdout) { should contain 'test-kitchen' }
end

describe command('curl --fail -s http://localhost:4567/clients/test-kitchen | jq -r .subscriptions') do
  its(:exit_status) { should eql 0 }
  its(:stdout) { should contain 'testing' }
end

describe command('curl --fail -s http://localhost:4567/info | jq -r .sensu.version') do
  its(:exit_status) { should eql 0 }
  its(:stdout) { should contain '0.26.5' }
end

%w(cpu-checks:1.0.0 disk-checks).each do |p|
  describe command("sensu-install -p #{p}") do
    its(:exit_status) { should eql 0 }
    its(:stdout) { should match /^true/ }
  end
end
