module Um
  class Markdown
    def self.render(text)
      return self.instance.render(text)
    end

    def self.instance
      @markdown ||= Redcarpet::Markdown.new(Um::Render.new,  :autolink => true, :fenced_code_blocks => true, :no_intra_emphasis => true)
    end
  end
end