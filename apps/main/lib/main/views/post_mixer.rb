module Main
  module Views
    class PostMixer
      attr_reader :posts

      def initialize(*sources)
        @posts = mix_posts(sources.map(&:to_a))
      end

      def mix_posts(sources)
        primary_posts, *secondary_posts = sources

        determenistic_random = Random.new(2468)
        rands = Array.new(primary_posts.length) { determenistic_random.rand(0..primary_posts.length) }

        return primary_posts if primary_posts.flatten.count < secondary_posts.flatten.count

        secondary_posts.flatten.each_with_index do |post, i|
          primary_posts.insert(rands[i], post) if rands[i]
        end
        primary_posts
      end
    end
  end
end
