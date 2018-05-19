import PropTypes from 'prop-types';

const cardType = PropTypes.shape({
  id: PropTypes.id,
  name: PropTypes.string,
  imagePath: PropTypes.string
});

export {
  cardType
};
