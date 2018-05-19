import React from 'react';
import { cardType } from '../types';

const propTypes = {
  cardData: cardType
};

function Card({ cardData }) {
  return (
    <img src={cardData.imagePath} />
  );
}

Card.propTypes = propTypes;

export default Card;
