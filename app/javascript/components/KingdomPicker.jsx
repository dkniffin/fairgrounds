import PropTypes from 'prop-types';
import React from 'react';
import CardPicker from './CardPicker';
import Kingdom from './Kingdom';
import { cardType } from '../types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType)
};


class KingdomPicker extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cards: []
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
    return (
      <div>
        <CardPicker
          cards={this.props.cards}
          onPick={this.addCardToKingdom}
        />
        <Kingdom cards={this.state.cards} />
      </div>
    );
  }
}

KingdomPicker.propTypes = propTypes;

export default KingdomPicker;
