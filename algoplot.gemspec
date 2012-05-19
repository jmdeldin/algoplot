Gem::Specification.new do |s|
  s.name         = 'algoplot'
  s.version      = '0.0.1'
  s.date         = '2012-05-15'
  s.summary      = "algoplot is a script to visually compare algorithms."
  s.description  =
    "algoplot uses Gnuplot to generate growth plots given N and functions."
  s.authors      = ["Jon-Michael Deldin"]
  s.email        = 'dev@jmdeldin.com'
  s.homepage     = 'http://github.com/jmdeldin/algoplot'
  s.files        = `git ls-files`.split("\n")
  s.executables  = ["algoplot"]
  s.require_path = 'lib'

  s.add_dependency('gnuplot', '>= 2.4.1')
end
