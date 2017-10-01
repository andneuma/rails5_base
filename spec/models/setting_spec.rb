require 'rails_helper'

RSpec.describe Setting, type: :model do
  context 'Attributes' do
    subject { build :settings }

    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :active }

    it { is_expected.to respond_to :relay_email_address }
    it { is_expected.to respond_to :app_title }
    it { is_expected.to respond_to :app_imprint }
    it { is_expected.to respond_to :app_privacy_policy }

    it { is_expected.to respond_to :activation_tokens_spawned }
    it { is_expected.to respond_to :activation_tokens_required }

    context 'Current settings' do
      it 'implements current settings' do
        expect(Setting).to respond_to :current_settings
      end

      it 'returns if current settings requires activation tokens for user registration' do
        settings = create :settings, activation_tokens_required: 2, active: true

        expect(Setting.current_settings.require_activation_tokens).to be true
      end
    end
  end

  context 'Activation tokens' do
    it 'defaults to 2' do
      expect(Setting.create.activation_tokens_spawned).to be 2
    end

    it 'does not except invalid number of activation tokens' do
      settings = build :settings, activation_tokens_spawned: -1

      expect(settings).not_to be_valid
    end
  end

  context 'Callbacks' do
    it 'should sanitize app imprint before validation' do
      settings = create :settings, app_imprint: '<center>This is an imprint</center>'

      expect(settings.app_imprint).to eq 'This is an imprint'
    end

    it 'should sanitize app privacy policy before validation' do
      settings = create :settings, app_privacy_policy: '<center>Privacy rulez!</center>'

      expect(settings.app_privacy_policy).to eq 'Privacy rulez!'
    end
  end

  context 'Validations' do
  end
end
