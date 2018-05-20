import React from 'react';
import { cardType } from 'types';
import './styles';

const propTypes = {
  cardData: cardType
};

function Card({ cardData }) {
  return (
    <img className="c-card" src={cardData.imagePath} />
  );
}

Card.propTypes = propTypes;

export default Card;
