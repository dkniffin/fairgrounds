import PropTypes from 'prop-types';

const cardType = PropTypes.shape({
  id: PropTypes.id,
  name: PropTypes.string,
  image_path: PropTypes.string
});

export {
  cardType
};
