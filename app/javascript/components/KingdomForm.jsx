import PropTypes from 'prop-types';
import React from 'react';
import CardPicker from 'components/CardPicker';
import Kingdom from 'components/Kingdom';
import { cardType, kingdomType } from 'types';

const propTypes = {
  cards: PropTypes.arrayOf(cardType),
  name: PropTypes.string,
  kingdom: kingdomType
};

class KingdomForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cards: [] // this.kingdom.cards ||
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
      <form className="c-kingdom-form">
        <div className="c-kingdom-form__form">
          <label htmlFor="name">Name</label>
          <input type="text" name="name" />

          <br />

          <label className="c-card-picker__label">Add a card</label>
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
        </div>
        <Kingdom
          showHeader={false}
          kingdom={{ cards: this.state.cards }}
        />
      </form>
    );
  }
}

KingdomForm.propTypes = propTypes;

export default KingdomForm;
