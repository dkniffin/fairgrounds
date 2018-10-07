import PropTypes from 'prop-types';
import React from 'react';
import { cardType } from 'types';

const propTypes = {
  cardData: cardType,
  onClose: PropTypes.func
};

function Card({ cardData, onClose }) {
  return (
    <div className="c-card">
      {onClose &&
        <button
          className="c-card__x-button"
          onClick={() => onClose(cardData)}
        >
          &#215;
        </button>}
      <img src={cardData.imagePath} title={cardData.name} />
    </div>
  );
}

Card.propTypes = propTypes;

export default Card;
