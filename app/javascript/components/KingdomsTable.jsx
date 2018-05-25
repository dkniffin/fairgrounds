import PropTypes from 'prop-types';
import React from 'react';
import { kingdomType } from 'types';
import ReactTable from 'react-table';
import "react-table/react-table.css";

const propTypes = {
  kingdoms: PropTypes.arrayOf(kingdomType)
};

function KingdomsTable({ kingdoms }) {
  return (
    <ReactTable
      data={kingdoms}
      filterable
      defaultFilterMethod={(filter, row) => {
        const searchQuery = filter.value.toLowerCase();
        const cellValue = row[filter.id].toLowerCase();
        return cellValue.includes(searchQuery);
      }}
      columns={[
        { Header: 'Name', accessor: 'name' },
        {
          Header: 'Cards',
          id: 'cards',
          accessor: (k) => k.cards.map((c) => c.name).join(', ')
          // filterMethod: (filter, row) => {
          //   const searchQuery = filter.value.toLowerCase();
          //   const cardsQuery = searchQuery.split(/,\s*/);

          //   const cardNames = row.cards.map((c) => c.name.toLowerCase());
          //   return cardsQuery.every((queriedCard) => {
          //     return cardNames.some((card) => card.includes(queriedCard));
          //   });
          // }
        }
      ]}
      resized={[
        { id: 'name', value: 250 },
        { id: 'cards', value: 'auto' }
      ]}
    />
  );
}

KingdomsTable.propTypes = propTypes;

export default KingdomsTable;
