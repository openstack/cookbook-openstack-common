require_relative 'spec_helper'

describe 'openstack-common::client' do
  describe 'redhat' do
    let(:runner) { ChefSpec::SoloRunner.new(REDHAT_OPTS) }
    let(:node) { runner.node }
    cached(:chef_run) do
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it do
      expect(chef_run).to upgrade_package('python-openstackclient')
    end
  end
end
