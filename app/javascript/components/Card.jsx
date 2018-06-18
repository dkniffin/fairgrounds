import React from 'react';
import { cardType } from 'types';

const propTypes = {
  cardData: cardType
};

function Card({ cardData }) {
  return (
    <div className="c-card">
      <img src={cardData.imagePath} />
    </div>
  );
}

Card.propTypes = propTypes;

export default Card;
