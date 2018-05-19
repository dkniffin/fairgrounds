import React from 'react';
import { cardType } from '../types';

const propTypes = {
  card: cardType
};

function Card({ card }) {
  return (
    <img src={card.image_path} />
  );
}

Card.propTypes = propTypes;

export default Card;
