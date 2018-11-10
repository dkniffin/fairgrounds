class ReactComponentInput < SimpleForm::Inputs::Base
  def input(_wrapper_options)
    component = input_options[:component]
    given_props = input_options[:props]
    value = object.send(attribute_name)
    props = {
      name: input_name,
      initialValue: value
    }.merge(given_props || {})

    template.react_component(component, props)
  end

  private

  def input_name
    "#{object_name}[#{attribute_name}]"
  end
end
