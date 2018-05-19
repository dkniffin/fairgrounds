import PropTypes from 'prop-types';
import React from 'react';
import { cardType } from '../types';
import Card from './Card';

const propTypes = {
  cards: PropTypes.arrayOf(cardType)
};

const CARD_WIDTH = 200;

function Kingdom({ cards }) {
  // TODO: Move this to CSS
  const style = {
    maxWidth: CARD_WIDTH * 5
  };
  return (
    <div style={style}>
      {cards.map((cardData) => {
        return (
          <Card
            key={cardData.id}
            cardData={cardData}
          />
        );
      })}
    </div>
  );
}

Kingdom.propTypes = propTypes;

export default Kingdom;
