import PropTypes from 'prop-types';
import React from 'react';

import { kingdomType } from 'main/types';
import Card from 'main/components/Card';
import Material from 'main/components/Material';


const propTypes = {
  kingdom: kingdomType,
  showHeader: PropTypes.bool,
  onCardClose: PropTypes.func
};

const defaultProps = {
  showHeader: true
};

function Kingdom({ kingdom, showHeader, onCardClose }) {
  const {
    name: titleString = 'New Kingdom',
    playCount = 0,
    rating,
    supplyCards = [],
    nonSupplyCards = [],
    materials = []
  } = kingdom;

  const ratingString = rating ?
    (new Array(rating + 1)).join('★ ').trim() :
    'TBD';

  return (
    <div className="c-kingdom">
      {showHeader &&
        <div className="c-kingdom__header">
          <a className="c-kingdom__title" href={`/kingdoms/${kingdom.id}`}>{titleString}</a>

          <div className="c-kingdom__rating">
            <div className="c-kingdom__label">Avg Rating</div>
            <span>{ratingString}</span>
          </div>
          <div className="c-kingdom__play-count">
            <div className="c-kingdom__label">Play Count</div>
            <span>{playCount}</span>
          </div>
        </div>
      }
      <div className="c-kingdom__subheader">Supply</div>
      <div className="c-kingdom__cards">
        {supplyCards.map((cardData) => {
          return (
            <Card
              key={cardData.id}
              cardData={cardData}
              onClose={onCardClose}
            />
          );
        })}
        {kingdom.cards.length === 0 &&
          <span>Empty Kingdom</span>
        }
      </div>
      {nonSupplyCards.length > 0 &&
        <React.Fragment>
          <div className="c-kingdom__subheader">Non-Supply</div>
          <div className="c-kingdom__horizontal-cards">
            {nonSupplyCards.map((cardData) => {
              return <Card key={cardData.id} cardData={cardData} />;
            })}
          </div>
        </React.Fragment>
      }
      {materials.length > 0 &&
        <React.Fragment>
          <div className="c-kingdom__subheader">Materials</div>
          <div className="c-kingdom__materials">
            {materials.map((material) => {
              return <Material key={material.id} materialData={material} />;
            })}
          </div>
        </React.Fragment>
      }
    </div>
  );
}

Kingdom.defaultProps = defaultProps;
Kingdom.propTypes = propTypes;

export default Kingdom;
