module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    md = Redcarpet::Markdown.new(
      renderer,
      :autolink => true, 
      :lax_html_blocks => true
    )
    md.render(text).html_safe
  end

  def teaser(text)
    t = markdown(text)
    truncate(t, length: 300, escape: false)
  end
end
