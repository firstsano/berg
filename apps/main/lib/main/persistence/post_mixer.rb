module Main
  module Persistence
    class PostMixer

      attr_reader :posts

      def initialize(*sources)
        @posts = mix_posts(sources.map(&:to_a))
      end

      def mix_posts(sources)
        primary_posts, *secondary_posts = sources

        determenistic_random = Random.new(133146)
        rands = primary_posts.length.times.map{|d| determenistic_random.rand(0..primary_posts.length) }
        secondary_posts.flatten.each_with_index do |p,i|
          primary_posts.insert(rands[i], p)
        end
        return primary_posts
      end
    end
  end
end
