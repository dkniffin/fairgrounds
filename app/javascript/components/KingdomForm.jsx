import PropTypes from 'prop-types';
import React from 'react';

import Kingdom from 'components/Kingdom';
import { Text, CardSetPicker } from 'components/Inputs';

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
      cards: props.kingdom.cards || []
    };
    this.addCardToKingdom = this.addCardToKingdom.bind(this);
  }

  addCardToKingdom(card) {
    const prevCards = this.state.cards;
    console.log(card)

    this.setState({
      cards: [...prevCards, card]
    });
  }

  render() {
    console.log(this.props.kingdom);
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

          <CardSetPicker
            cards={this.props.cards}
            onAddCard={this.addCardToKingdom}
            input={{ name: 'kingdom[card_ids][]' }}
            initialValue={this.state.cards}
            errors={this.props.kingdom.errors.cards}
          />

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
