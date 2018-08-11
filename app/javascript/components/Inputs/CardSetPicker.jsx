import PropTypes from 'prop-types';
import React from 'react';
import classNames from 'classnames';

import CardPicker from 'components/Inputs/CardPicker';

import { cardType, inputType } from 'types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType).isRequired,
  onAddCard: PropTypes.func,
  input: inputType,
  initialValue: PropTypes.arrayOf(cardType),
  errors: PropTypes.arrayOf(PropTypes.string)
};

const defaultProps = {
  initialValue: []
};

class CardSetPicker extends React.Component {
  constructor(props) {
    super(props);


    const availableCards = props.initialValue.reduce((acc, selectedCard) => {
      return this.filterOut(acc, selectedCard);
    }, props.cards);

    this.state = {
      cards: props.initialValue,
      availableCards
    };

    this.addCardToSet = this.addCardToSet.bind(this);
    this.filterOut = this.filterOut.bind(this);
  }

  filterOut(cards, selectedCard) {
    return cards.filter((c) => c.id !== selectedCard.id);
  }

  addCardToSet(card) {
    const prevCards = this.state.cards;
    const availableCards = this.filterOut(this.state.availableCards, card);

    this.props.onAddCard && this.props.onAddCard(card);

    this.setState({
      cards: [...prevCards, card],
      availableCards
    });
  }

  render() {
    // TODO: Abstract this to a component that can be used for all/most inputs
    const errorsPresent = this.props.errors.length > 0;
    const className = classNames(
      'c-input',
      {
        'c-input--error': errorsPresent
      }
    );


    // TODO: Figure out how to let the user delete cards from the set
    return (
      <div>
        <label className="c-card-picker__label">Add a card</label>
        <CardPicker
          cards={this.state.availableCards}
          onPick={this.addCardToSet}
          className={className}
        />
        {this.state.cards.map((card) => {
          return (
            <input
              key={card.id}
              type="hidden"
              name={this.props.input.name}
              value={card.id}
            />
          );
        })}

        {errorsPresent &&
          <span className="c-input__error-text">
            {this.props.errors}
          </span>
        }
      </div>
    );
  }
}

CardSetPicker.propTypes = propTypes;
CardSetPicker.defaultProps = defaultProps;

export default CardSetPicker;
