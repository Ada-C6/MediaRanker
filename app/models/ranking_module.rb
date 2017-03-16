# Info on using mixins in Rails: http://stackoverflow.com/questions/4699355/is-that-possible-to-define-a-class-method-in-a-module,
# http://www.webascender.com/Blog/ID/757/Tutorial-Classes-Inheritance-Modules-and-Mixins-in-Ruby-on-Rails#.WAFMmZMrJsM

module RankingModule

  extend ActiveSupport::Concern

    def all_ranked
      return self.order(upvotes: :desc)
    end

    def top_ten
      return self.order(upvotes: :desc).limit(10)
    end

end
