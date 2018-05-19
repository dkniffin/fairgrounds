import React from 'react';
import PropTypes from 'prop-types';

const propTypes = {
  a: PropTypes.number
};

function HelloWorld(props) {
  return (
    <div>{props.a}</div>
  );
}

HelloWorld.propTypes = propTypes;

export default HelloWorld;
