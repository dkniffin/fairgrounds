import PropTypes from 'prop-types';
import React from 'react';

import { kingdomType } from 'types';
import Kingdom from 'components/Kingdom';

const propTypes = {
  kingdoms: PropTypes.arrayOf(kingdomType)
};

function KingdomsList({ kingdoms }) {
  return (
    <div className="c-kingdom-list">
      {kingdoms.map((kingdom) => {
        return <Kingdom key={kingdom.id} kingdom={kingdom} />;
      })}
    </div>
  );
}

KingdomsList.propTypes = propTypes;

export default KingdomsList;
