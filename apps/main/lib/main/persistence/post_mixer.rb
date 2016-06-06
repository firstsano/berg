module Main
  module Persistence
    class PostMixer

      attr_reader :posts

      def initialize(*sources)
        @posts = mix_posts(sources.map(&:to_a))
      end

      def mix_posts(sources)
        a1 = sources[0]
        a2 = sources[1..sources.length]

        determenistic_random = Random.new(133146)
        rands = a1.length.times.map{|d| determenistic_random.rand(0..a1.length) }
        a2.flatten.each_with_index do |p,i|
          a1.insert(rands[i], p)
        end
        return a1
      end
    end
  end
end
