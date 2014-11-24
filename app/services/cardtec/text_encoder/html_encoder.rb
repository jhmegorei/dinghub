class Cardtec::TextEncoder::HtmlEncoder
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def initialize(text_encoder)
    @text_encoder = text_encoder
  end

  def to_html
    content_tag(:dl) do
      @text_encoder.to_hash.map do |k, v|
        content_tag(:dt, k) <<
        content_tag(:dd, v)
      end.join.html_safe
    end
  end

end