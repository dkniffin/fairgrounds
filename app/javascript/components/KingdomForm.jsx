import PropTypes from 'prop-types';
import React from 'react';

import CardPicker from 'components/CardPicker';
import Kingdom from 'components/Kingdom';
import { Text } from 'components/Inputs';

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
            error={this.props.kingdom.errors.name}
            required="true"
          />

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
        />
      </form>
    );
  }
}

KingdomForm.propTypes = propTypes;

export default KingdomForm;
