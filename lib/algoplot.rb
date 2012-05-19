require 'gnuplot'

module AlgoPlot

  def self.get_extension(filename)
    File.extname(filename.downcase).delete('.')
  end

  def self.is_extension_allowed?(ext)
    %w(pdf png jpg).include? ext
  end

  # ds.with = "lines"
  def self.create_dataset(func)
    Gnuplot::DataSet.new(func)
  end

  def self.plot(n, functions, filename)
    ext = get_extension(filename)
    fail "Extension #{ext} not allowed" unless is_extension_allowed?(ext)
    Gnuplot.open do |gp|
      Gnuplot::Plot.new(gp) do |plot|
        plot.terminal ext
        plot.output filename
        plot.xrange "[0:#{n}]"
        plot.title "Growth of #{functions.join(', ')}"
        plot.ylabel "steps"
        plot.xlabel "N"
        plot.data = functions.map { |f| create_dataset(f) }
      end
    end
  end

end
