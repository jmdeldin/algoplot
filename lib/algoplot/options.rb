require 'optparse'
require_relative '../algoplot'

module AlgoPlot
  class Options
    attr_reader :options

    SCRIPT = 'algoplot'

    def initialize(argv)
      @options = {:n => 100, :functions => [], :output => nil}

      argv = ["-h"] if argv.empty?
      parse_options(argv)
    end

    private

    def parse_options(argv)
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{SCRIPT} -o FILE.pdf fn1 fn2 [...]"

        opts.on("-n SIZE", "--size", "input size") do |n|
          @options[:n] = n.to_i
        end

        opts.on("-o FILE", "--output", "filename (PNG, PDF, JPG)") do |o|
          @options[:output] = o
        end

        opts.on('-h', '--help', 'show this screen') do
          STDERR.puts opts
          abort
        end
      end

      parser.parse!(argv)

      if options[:output].nil?
        raise ArgumentError, "Output filename must be given\n#{parser}"
      end

      if argv.size < 2
        raise ArgumentError, "At least two functions must be given.\n#{parser}"
      else
        @options[:functions] = argv
      end
    end


  end
end
