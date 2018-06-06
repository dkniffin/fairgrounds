import classNames from 'classnames';
import PropTypes from 'prop-types';
import React from 'react';
import { cardType } from 'types';

const propTypes = {
  cardData: cardType,
  small: PropTypes.bool
};

function Card({ cardData, small }) {
  const classes = classNames({
    'c-card': true,
    'c-card--small': small
  });

  return (
    <img className={classes} src={cardData.imagePath} />
  );
}

Card.propTypes = propTypes;

export default Card;
