import PropTypes from 'prop-types';
import React, { Component } from 'react';
import ReactStarRating from 'react-star-rating-component';

import UserIcon from 'main/components/UserIcon';
import StarIcon from 'main/components/StarIcon';

const propTypes = {
  icon: PropTypes.string,
  initialValue: PropTypes.number
};

const defaultProps = {
  initialValue: 0,
  icon: 'star'
};

class RatingInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      value: props.initialValue
    };

    this.onStarClick = this.onStarClick.bind(this);
  }

  onStarClick(nextValue) {
    this.setState({
      value: nextValue
    });
  }

  render() {
    const Icon = this.props.icon === 'user' ? UserIcon : StarIcon;

    return (
      <ReactStarRating
        {...this.props}
        onStarClick={this.onStarClick}
        value={this.state.value}
        starColor="#dc8c46"
        renderStarIcon={() => {
          return <div style={{ width: 20, height: 20 }}><Icon /></div>;
        }}
      />
    );
  }
}

RatingInput.propTypes = propTypes;
RatingInput.defaultProps = defaultProps;

export default RatingInput;
