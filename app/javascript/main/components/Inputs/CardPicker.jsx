import PropTypes from 'prop-types';
import React from 'react';
import classNames from 'classnames';
import Autosuggest from 'react-autosuggest';
import Card from 'main/components/Card';
import { cardType } from 'main/types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType),
  onPick: PropTypes.func,
  errors: PropTypes.arrayOf(PropTypes.string)
};

const defaultProps = {
  errors: []
};

class CardPicker extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      suggestions: [],
      value: ''
    };
    this.onChange = this.onChange.bind(this);
    this.onSuggestionsFetchRequested = this.onSuggestionsFetchRequested.bind(this);
    this.onSuggestionsClearRequested = this.onSuggestionsClearRequested.bind(this);
    this.onSuggestionSelected = this.onSuggestionSelected.bind(this);
  }

  onChange(event, { newValue }) {
    this.setState({
      value: newValue
    });
  }

  onSuggestionsFetchRequested({ value }) {
    const inputValue = value.trim().toLowerCase();
    const inputLength = inputValue.length;

    const suggestions = (inputLength === 0) ? [] : this.props.cards.filter((card) => {
      return card.name.toLowerCase().slice(0, inputLength) === inputValue;
    });

    this.setState({
      suggestions
    });
  }

  onSuggestionsClearRequested() {
    this.setState({
      suggestions: []
    });
  }

  onSuggestionSelected(_, { suggestion }) {
    if (typeof this.props.onPick !== 'undefined') {
      this.props.onPick(suggestion);
      this.setState({ value: '' });
    }
  }

  render() {
    const { value, suggestions } = this.state;
    const errorsPresent = this.props.errors.length > 0;
    const className = classNames(
      'c-input',
      'c-card-picker',
      {
        'c-input--error': errorsPresent
      }
    );

    const inputProps = {
      placeholder: 'Type a card name',
      value,
      onChange: this.onChange,
      className: 'c-input__input'
    };

    return (
      <div className={className}>
        <label className="c-card-picker__label">Add a card</label>
        <Autosuggest
          suggestions={suggestions}
          onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
          onSuggestionsClearRequested={this.onSuggestionsClearRequested}
          onSuggestionSelected={this.onSuggestionSelected}
          getSuggestionValue={(card) => card.name}
          renderSuggestion={(cardData) => {
            return (
              <React.Fragment>
                <Card cardData={cardData} />
                <span>{cardData.name}</span>
              </React.Fragment>
            );
          }}
          inputProps={inputProps}
        />
        {errorsPresent &&
          <span className="c-input__error-text">
            {this.props.errors}
          </span>
        }
      </div>
    );
  }
}

CardPicker.propTypes = propTypes;
CardPicker.defaultProps = defaultProps;

export default CardPicker;
