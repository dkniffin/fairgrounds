import PropTypes from 'prop-types';
import React from 'react';
import { cardType } from 'types';
import Card from 'components/Card';

const propTypes = {
  cards: PropTypes.arrayOf(cardType)
};

function Kingdom({ cards }) {
  return (
    <div className="c-kingdom">
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
