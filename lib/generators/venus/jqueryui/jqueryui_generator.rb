module Venus
  module Generators
    class JqueryuiGenerator < Base
      desc "Setup for jQuery UI"

      def name
        "jqueryui"
      end

      def asks
        @target_js = ask?('target content append for js file?', 'application.js')
        @target_css = ask?('target content append for css file?', 'application.css')
        @datepicker = ask?('setup for datepicker?', true)
        if @datepicker
          puts "datepicker lang list: https://github.com/joliss/jquery-ui-rails/tree/master/vendor/assets/javascripts"
          @datepicker_lang = ask?('datepicker language?', '')
        end
      end

      def gem
        add_gem('jquery-ui-rails', '~> 4.0.1')
        bundle_install
      end

      def datepicker
        if @datepicker
          css_assets_require(@target_css, "jquery.ui.datepicker")
          insert_js_template(@target_js, "datepicker.js")
          js_assets_require(@target_js, "jquery.ui.datepicker")
          js_assets_require(@target_js, "jquery.ui.datepicker-#{@datepicker_lang}") if @datepicker_lang.present?
        end
      end

      def more
        puts "see more: https://github.com/joliss/jquery-ui-rails"
      end

    end
  end
end
