import PropTypes from 'prop-types';
import React from 'react';
import ReactStarRating from 'react-star-rating-component';

import UserIcon from 'components/UserIcon';
import StarIcon from 'components/StarIcon';

const propTypes = {
  icon: PropTypes.string
};

function RatingInput(props) {
  const Icon = props.icon === 'user' ? UserIcon : StarIcon;
  return (
    <ReactStarRating
      {...props}
      starColor="#dc8c46"
      renderStarIcon={() => {
        return <div style={{ width: 20, height: 20 }}><Icon /></div>;
      }}
    />
  );
}

RatingInput.propTypes = propTypes;

export default RatingInput;
