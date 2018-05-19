import React from 'react';
import { cardType } from '../types';

const propTypes = {
  card: cardType
};

function Card({ card }) {
  return (
    <img src={card.imagePath} />
  );
}

Card.propTypes = propTypes;

export default Card;
