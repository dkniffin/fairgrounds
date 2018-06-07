import React from 'react';

import { kingdomType } from 'types';
import Card from 'components/Card';

const propTypes = {
  kingdom: kingdomType
};

function Kingdom({ kingdom }) {
  const ratingString = kingdom.rating ? (new Array(kingdom.rating + 1)).join('* ').trim() : '';
  return (
    <div className="c-kingdom">
      <div className="c-kingdom__header">
        <span className="c-kingdom__title">{kingdom.name}</span>

        <div className="c-kingdom__rating">
          <div className="c-kingdom__label">Avg Rating</div>
          {/* TODO: Display this as stars instead of asterisks */}
          <span>{ratingString}</span>
        </div>
        <div className="c-kingdom__play-count">
          <div className="c-kingdom__label">Play Count</div>
          {/* TODO: Save play count on the backend, and display that here */}
          <span>100</span>
        </div>
      </div>
      <div className="c-kingdom__cards">
        {kingdom.cards.map((cardData) => {
          return (
            <Card
              key={cardData.id}
              cardData={cardData}
              small
            />
          );
        })}
      </div>
    </div>
  );
}

Kingdom.propTypes = propTypes;

export default Kingdom;
