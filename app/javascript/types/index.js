import PropTypes from 'prop-types';

const cardType = PropTypes.shape({
  id: PropTypes.id,
  name: PropTypes.string,
  imagePath: PropTypes.string
});

const kingdomType = PropTypes.shape({
  id: PropTypes.id,
  name: PropTypes.string,
  cards: PropTypes.arrayOf(cardType)
});

export {
  cardType,
  kingdomType
};
