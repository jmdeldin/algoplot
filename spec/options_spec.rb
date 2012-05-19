require 'minitest/autorun'
require_relative '../lib/algoplot/options'

describe :Options do
  subject { AlgoPlot::Options }

  it 'fails when given fewer than two functions' do
    lambda { subject.new(%w(x)) }.must_raise ArgumentError
  end

  it 'fails when output is omitted' do
    lambda { subject.new(%w(x x**2)) }.must_raise ArgumentError
  end

  it 'returns a hash of options' do
    opts = subject.new(%w(-o foo.png -n 2000 x x**2))

    exp = {:n => 2000, :output => 'foo.png', :functions => %w(x x**2)}

    opts.options.must_equal exp
  end


end
