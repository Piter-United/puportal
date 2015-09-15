require 'rails_helper'

RSpec.describe Ability do
  let(:ability) { Ability.new(user) }

  context 'unauthorized user' do
    let(:user) { nil }

    it { expect(ability).to be_able_to(:read, Community) }
    it { expect(ability).to_not be_able_to(:create, Community) }
    it { expect(ability).to_not be_able_to(:update, Community) }
    it { expect(ability).to_not be_able_to(:destroy, Community) }

    it { expect(ability).to be_able_to(:read, Event) }
    it { expect(ability).to_not be_able_to(:create, Event) }
    it { expect(ability).to_not be_able_to(:update, Event) }
    it { expect(ability).to_not be_able_to(:destroy, Event) }

    it { expect(ability).to_not be_able_to(:create,  Member) }
    it { expect(ability).to_not be_able_to(:destroy, Member) }
  end

  context 'authorized user' do
    let(:user) { build(:user) }

    it { expect(ability).to be_able_to(:read, Community) }
    it { expect(ability).to be_able_to(:create, Community) }
    it { expect(ability).to be_able_to(:update, Community) }
    it { expect(ability).to be_able_to(:destroy, Community) }

    it { expect(ability).to be_able_to(:read, Event) }
    it { expect(ability).to be_able_to(:create, Event) }
    it { expect(ability).to be_able_to(:update, Event) }
    it { expect(ability).to be_able_to(:destroy, Event) }

    it { expect(ability).to be_able_to(:create,  Member) }
    it { expect(ability).to be_able_to(:destroy, Member) }
  end
end
