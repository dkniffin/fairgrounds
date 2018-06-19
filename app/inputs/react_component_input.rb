class ReactComponentInput < SimpleForm::Inputs::Base
  def input(_wrapper_options)
    component = input_options[:component]
    given_props = input_options[:props]
    value = object.send(attribute_name)
    props = {
      name: input_name,
      value: value
    }.merge(given_props || {})

    template.react_component(component, props: props)
  end

  private

  def input_name
    "#{object_name}[#{attribute_name}]"
  end
end
