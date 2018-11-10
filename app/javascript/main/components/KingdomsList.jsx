import PropTypes from 'prop-types';
import React from 'react';

import { kingdomType } from 'main/types';
import Kingdom from 'main/components/Kingdom';

const propTypes = {
  kingdoms: PropTypes.arrayOf(kingdomType)
};

function KingdomsList({ kingdoms }) {
  return (
    <div className="c-kingdom-list">
      {kingdoms.map((kingdom) => {
        return <Kingdom key={kingdom.id} kingdom={kingdom} small />;
      })}
    </div>
  );
}

KingdomsList.propTypes = propTypes;

export default KingdomsList;
