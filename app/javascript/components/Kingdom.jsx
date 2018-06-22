import PropTypes from 'prop-types';
import React from 'react';

import { kingdomType } from 'types';
import Card from 'components/Card';

import Routes from 'routes';

const propTypes = {
  kingdom: kingdomType,
  showHeader: PropTypes.bool
};

const defaultProps = {
  showHeader: true
};

function Kingdom({ kingdom, showHeader }) {
  // TODO: Display the rating as stars instead of asterisks
  const ratingString = kingdom.rating ?
    (new Array(kingdom.rating + 1)).join('* ').trim() :
    'TBD';
  const titleString = kingdom.name || 'New Kingdom';
  const playCountString = kingdom.playCount || 0;

  return (
    <div className="c-kingdom">
      {showHeader &&
        <div className="c-kingdom__header">
          <a className="c-kingdom__title" href={Routes.kingdomPath(kingdom.id)}>{titleString}</a>

          <div className="c-kingdom__rating">
            <div className="c-kingdom__label">Avg Rating</div>
            <span>{ratingString}</span>
          </div>
          <div className="c-kingdom__play-count">
            <div className="c-kingdom__label">Play Count</div>
            <span>{playCountString}</span>
          </div>
        </div>
      }
      <div className="c-kingdom__cards">
        {kingdom.cards.map((cardData) => {
          return (
            <Card
              key={cardData.id}
              cardData={cardData}
            />
          );
        })}
      </div>
    </div>
  );
}

Kingdom.defaultProps = defaultProps;
Kingdom.propTypes = propTypes;

export default Kingdom;
