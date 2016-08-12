require 'dry/monads'
require 'dry/matcher'
require 'dry/matcher/either_matcher'

module Berg
  Matcher = Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)
end
