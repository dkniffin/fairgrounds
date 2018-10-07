import PropTypes from 'prop-types';

const cardType = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  imagePath: PropTypes.string.isRequired
});

const materialType = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  imagePath: PropTypes.string.isRequired,
  mat: PropTypes.bool.isRequired,
  token: PropTypes.bool.isRequired
});

const kingdomType = PropTypes.shape({
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  cards: PropTypes.arrayOf(cardType).isRequired,
  supplyCards: PropTypes.arrayOf(cardType).isRequired,
  nonSupplyCards: PropTypes.arrayOf(cardType).isRequired,
  materials: PropTypes.arrayOf(materialType).isRequired
});

const inputType = PropTypes.shape({
  name: PropTypes.string.isRequired
});

export {
  cardType,
  kingdomType,
  materialType,
  inputType
};
