import React from 'react';

import { kingdomType } from 'types';
import Card from 'components/Card';

const propTypes = {
  kingdom: kingdomType
};

function KingdomCard({ kingdom }) {
  const ratingString = (new Array(kingdom.rating + 1)).join('* ').trim();
  return (
    <div className="c-kingdom-card">
      <div className="c-kingdom-card__header">
        <span className="c-kingdom-card__title">{kingdom.name}</span>

        <div className="c-kingdom-card__rating">
          <div className="c-kingdom-card__label">Avg Rating</div>
          <span>{ratingString}</span>
        </div>
        <div className="c-kingdom-card__play-count">
          <div className="c-kingdom-card__label">Play Count</div>
          <span>100</span>
        </div>
      </div>
      <div className="c-kingdom-card__cards">
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

KingdomCard.propTypes = propTypes;

export default KingdomCard;
