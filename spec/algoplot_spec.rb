require 'minitest/autorun'
require_relative '../lib/algoplot'
require_relative '../lib/algoplot/options'

describe :AlgoPlot do
  it 'only accepts JPG, PNG, PDF extensions' do
    %w(pdf png jpg).each do |ext|
      AlgoPlot::is_extension_allowed?(ext).must_equal true
    end

    AlgoPlot::is_extension_allowed?('gif').wont_equal true
  end

  it 'separates a file extension from the filename' do
    AlgoPlot::get_extension('example.file.png').must_equal 'png'
  end

  it 'downcases a file extension' do
    AlgoPlot::get_extension('example.file.PNG').must_equal 'png'
  end

  it 'creates a DataSet object from a string' do
    AlgoPlot::create_dataset('x**2').must_be_instance_of(Gnuplot::DataSet)
  end

  it 'writes plots to a file' do
    require 'tempfile'
    file = Tempfile.new(['plot', '.png'])

    begin
      AlgoPlot::plot(100, %w(x x**2), file.path)
      File.size(file.path).must_be :>, 10
    ensure
      file.close
      file.unlink
    end
  end
end
