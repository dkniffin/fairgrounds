import PropTypes from 'prop-types';
import React from 'react';

import Kingdom from 'components/Kingdom';
import { Text, CardPicker } from 'components/Inputs';

import { cardType, kingdomType } from 'types';

const propTypes = {
  authenticityToken: PropTypes.string.isRequired,
  cards: PropTypes.arrayOf(cardType),
  kingdom: kingdomType,
  submitEndpoint: PropTypes.string.isRequired,
  submitVerb: PropTypes.string.isRequired
};

class KingdomForm extends React.Component {
  constructor(props) {
    super(props);

    const selectedCards = props.kingdom.cards || [];

    const availableCards = selectedCards.reduce((acc, selectedCard) => {
      return this.filterOut(acc, selectedCard);
    }, props.cards);

    this.state = {
      cards: selectedCards || [],
      availableCards
    };

    this.filterOut = this.filterOut.bind(this);
    this.addCardToKingdom = this.addCardToKingdom.bind(this);
    this.removeCardFromKingdom = this.removeCardFromKingdom.bind(this);
  }

  filterOut(cards, cardToRemove) {
    return cards.filter((c) => c.id !== cardToRemove.id);
  }

  removeCardFromKingdom(card) {
    const cards = this.filterOut(this.state.cards, card);
    const availableCards = this.state.availableCards.concat([card]);

    this.setState({
      cards,
      availableCards
    });
  }

  addCardToKingdom(card) {
    const prevCards = this.state.cards;
    const availableCards = this.filterOut(this.state.availableCards, card);

    this.setState({
      cards: [...prevCards, card],
      availableCards
    });
  }

  render() {
    return (
      <form
        className="c-kingdom-form"
        action={this.props.submitEndpoint}
        method={this.props.submitVerb}
      >
        <input type="hidden" name="authenticity_token" value={this.props.authenticityToken} />

        <div className="c-kingdom-form__form">
          <Text
            label="Name"
            input={{ name: 'kingdom[name]' }}
            errors={this.props.kingdom.errors.name}
            initialValue={this.props.kingdom.name}
            required
          />

          <br />

          <CardPicker
            cards={this.state.availableCards}
            onPick={this.addCardToKingdom}
            errors={this.props.kingdom.errors.cards}
          />
          {this.state.cards.map((card) => {
            return (
              <input
                key={card.id}
                type="hidden"
                name="kingdom[card_ids][]"
                value={card.id}
              />
            );
          })}

          <button>Submit</button>
        </div>
        <Kingdom
          showHeader={false}
          kingdom={{ cards: this.state.cards }}
          onCardClose={this.removeCardFromKingdom}
        />
      </form>
    );
  }
}

KingdomForm.propTypes = propTypes;

export default KingdomForm;
