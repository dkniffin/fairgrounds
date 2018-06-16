import React from 'react';

import ReactStarRating from 'react-star-rating-component';

const propTypes = { };

function RatingInput(props) {
  return (
    <ReactStarRating {...props} />
  );
}

RatingInput.propTypes = propTypes;

export default RatingInput;
