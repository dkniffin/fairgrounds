import PropTypes from 'prop-types';
import React from 'react';
import classNames from 'classnames';
import Autosuggest from 'react-autosuggest';
import Card from 'components/Card';
import { cardType } from 'types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType),
  onPick: PropTypes.func,
  className: PropTypes.string
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

    const inputProps = {
      placeholder: 'Type a card name',
      value,
      onChange: this.onChange
    };

    const className = classNames('c-card-picker', this.props.className);

    return (
      <div className={className}>
        <Autosuggest
          suggestions={suggestions}
          onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
          onSuggestionsClearRequested={this.onSuggestionsClearRequested}
          onSuggestionSelected={this.onSuggestionSelected}
          getSuggestionValue={(card) => card.name}
          // renderSuggestion={(cardData) => <p>{cardData.name}</p>}
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
      </div>
    );
  }
}

CardPicker.propTypes = propTypes;

export default CardPicker;