require 'asciidoctor'
# require 'workshopper/extensions/emoji-inline-macros'

module Workshopper
  module Renderer
    class Asciidoc

      def initialize(workshop, templates)
        @workshop = workshop
        @templates = templates
      end

      def extension
        'adoc'
      end

      def render(content, env)
        # Asciidoctor::Extensions.register do |document|
        #   inline_macro EmojiInlineMacro
        #   docinfo_processor EmojiAssetsDocinfoProcessor
        #   # block_macro Asciidoctor::GistBlockMacro if document.basebackend? 'html'
        #   # include_processor Asciidoctor::UriIncludeProcessor
        # end
        #
        content = @templates.render(content, env)
        content = Asciidoctor::Document.new(content, attributes: {
            'icons' => 'font',
            'imagesdir' => '/api/workshops/' + @workshop + '/content/assets/images',
            'source-highlighter' => 'highlightjs',
        })
        content.convert
      end

    end
  end
end
