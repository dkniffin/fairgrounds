import PropTypes from 'prop-types';
import React from 'react';
import classNames from 'classnames';

import { inputType } from 'main/types';

const propTypes = {
  input: inputType,
  label: PropTypes.string,
  errors: PropTypes.arrayOf(PropTypes.string),
  required: PropTypes.bool
};

const defaultProps = {
  required: false,
  errors: []
};

function Text({ input, label, errors, required }) {
  // TODO: Abstract this to a component that can be used for all/most inputs
  const errorsPresent = errors.length > 0;
  const classes = classNames(
    'c-input',
    'c-input--text',
    {
      'c-input--error': errorsPresent
    }
  );

  return (
    <div className={classes}>
      <label htmlFor={input.name}>
        {label}
        {required &&
          <span className="c-input__required-asterisk">*</span>
        }
      </label>

      <input
        type="text"
        id={input.name}
        {...input}
        className="c-input__input"
      />

      {errorsPresent &&
        <span className="c-input__error-text">
          {errors}
        </span>
      }
    </div>
  );
}

Text.propTypes = propTypes;
Text.defaultProps = defaultProps;

export default Text;
