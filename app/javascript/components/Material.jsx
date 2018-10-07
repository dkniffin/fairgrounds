import classnames from 'classnames';
import PropTypes from 'prop-types';
import React from 'react';
import { materialType } from 'types';

const propTypes = {
  materialData: materialType,
  onClose: PropTypes.func
};

function Material({ materialData }) {
  const {
    mat,
    token
  } = materialData;

  const classNames = classnames(
    'c-material', {
      'c-material--mat': mat,
      'c-material--token': token
    }
  );

  return (
    <div className={classNames}>
      <img src={materialData.imagePath} title={materialData.name} />
    </div>
  );
}

Material.propTypes = propTypes;

export default Material;
