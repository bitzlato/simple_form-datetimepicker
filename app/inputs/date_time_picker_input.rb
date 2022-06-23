class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    options = {
      data: {
        behaviour: 'date_picker',
        'date-format':  I18n.t('time.formats.date_picker_js')
      }
    }

    value = if object.respond_to?(attribute_name) && object.send(attribute_name).present?
      I18n.localize(object.send(attribute_name), format: :date_picker)
    end

    options[:value] = value if value.present?

    options[:data][:'side-by-side'] =  @options[:'side_by_side'] || false
    options[:data][:'icon-provider'] = case @options[:icons]
    when :font_awesome
      'fa'
    else
      'fa'
    end

    super.merge options
  end
end
