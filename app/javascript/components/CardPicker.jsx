import PropTypes from 'prop-types';
import React from 'react';
import Autosuggest from 'react-autosuggest';
import { cardType } from '../types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType)
};

class CardPicker extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cards: this.props.cards,
      suggestions: [],
      value: ''
    };
    this.onChange = this.onChange.bind(this);
    this.onSuggestionsFetchRequested = this.onSuggestionsFetchRequested.bind(this);
    this.onSuggestionsClearRequested = this.onSuggestionsClearRequested.bind(this);
  }

  onChange(event, { newValue }) {
    this.setState({
      value: newValue
    });
  }

  onSuggestionsFetchRequested({ value }) {
    const inputValue = value.trim().toLowerCase();
    const inputLength = inputValue.length;

    const suggestions = (inputLength === 0) ? [] : this.state.cards.filter((card) => {
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

  render() {
    const { value, suggestions } = this.state;

    const inputProps = {
      placeholder: 'Type a card name',
      value,
      onChange: this.onChange
    };

    // Finally, render it!
    return (
      <Autosuggest
        suggestions={suggestions}
        onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
        onSuggestionsClearRequested={this.onSuggestionsClearRequested}
        getSuggestionValue={(card) => card.name}
        renderSuggestion={(card) => <div>{card.name}</div>}
        inputProps={inputProps}
      />
    );
  }
}

CardPicker.propTypes = propTypes;

export default CardPicker;
