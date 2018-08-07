import PropTypes from 'prop-types';
import React from 'react';
import classNames from 'classnames';

const propTypes = {
  input: PropTypes.object,
  label: PropTypes.string,
  error: PropTypes.error,
  required: PropTypes.bool
};

const defaultProps = {
  required: false
};

function Text({ input, label, error, required }) {
  const classes = classNames(
    'c-input',
    'c-input--text',
    {
      'c-input--error': !!error
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

      {error &&
        <span className="c-input__error-text">
          {error}
        </span>
      }
    </div>
  );
}

Text.propTypes = propTypes;
Text.defaultProps = defaultProps;

export default Text;
