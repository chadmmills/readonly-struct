require 'spec_helper'

describe ReadonlyStruct do
  it 'can set methods on the fly' do
    expect(
      ReadonlyStruct.new(foo: :bar).foo
    ).to eq :bar
  end

  it "can set multiple methods at initialize" do
    expect(
      ReadonlyStruct.new(foo: :bar, twenty: 20).twenty
    ).to eq 20
  end

  it "will raise error when attempting to call undefined method" do
    expect do
      ReadonlyStruct.new.foo
    end.to raise_error NoMethodError
  end
end
