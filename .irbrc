# can quickly benchmark anything in irb, e.g.
# measure { is_this_slow? }
#
# use benchmark-ips over vanilla benchmark.
# Knowing standard deviation is sometimes more important than knowing the time
# for N iterations
begin
  require 'benchmark/ips' unless defined?(Benchmark::IPS)

  def measure
    Benchmark.ips do |x|
      x.report do |max|
        max.times { yield }
      end
    end
    nil
  end
rescue LoadError => err
  warn "#{err} - try `gem install benchmark-ips`"
end
