module Um
  class Render < Redcarpet::Render::HTML
    def initialize(extensions={})
      super(extensions.merge(:xhtml => true, :no_styles => true, :filter_html => true, :hard_wrap => true))
    end
  end
end