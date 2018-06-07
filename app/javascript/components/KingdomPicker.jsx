import PropTypes from 'prop-types';
import React from 'react';
import CardPicker from 'components/CardPicker';
import Kingdom from 'components/Kingdom';
import { cardType } from 'types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType),
  name: PropTypes.string.isRequired,
  initialValue: PropTypes.arrayOf(cardType)
};

class KingdomPicker extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cards: this.props.initialValue || []
    };
    this.addCardToKingdom = this.addCardToKingdom.bind(this);
  }

  addCardToKingdom(card) {
    const prevCards = this.state.cards;

    this.setState({
      cards: [...prevCards, card]
    });
  }

  render() {
    const availableCards = this.props.cards.filter((card) => {
      return this.state.cards.indexOf(card) === -1;
    });
    return (
      <div>
        <span>Add a card:</span>
        <CardPicker
          cards={availableCards}
          onPick={this.addCardToKingdom}
        />
        {this.state.cards.map((card) => {
          return (
            <input
              key={card.id}
              type="hidden"
              name={this.props.name}
              value={card.id}
            />
          );
        })}
        <Kingdom
          kingdom={{ cards: this.state.cards }}
        />
      </div>
    );
  }
}

KingdomPicker.propTypes = propTypes;

export default KingdomPicker;
