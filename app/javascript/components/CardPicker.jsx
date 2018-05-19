import PropTypes from 'prop-types';
import React from 'react';
import Autosuggest from 'react-autosuggest';
import Card from './Card';
import { cardType } from '../types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType),
  onPick: PropTypes.func
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

    return (
      <Autosuggest
        suggestions={suggestions}
        onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
        onSuggestionsClearRequested={this.onSuggestionsClearRequested}
        onSuggestionSelected={this.onSuggestionSelected}
        getSuggestionValue={(card) => card.name}
        renderSuggestion={(cardData) => <Card cardData={cardData} />}
        inputProps={inputProps}
      />
    );
  }
}

CardPicker.propTypes = propTypes;

export default CardPicker;
