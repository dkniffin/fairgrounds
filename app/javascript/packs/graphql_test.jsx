import React from 'react';
import ReactDOM from 'react-dom';
import gql from 'graphql-tag';
import { ApolloProvider, Query } from 'react-apollo';

// import Kingdom from 'main/components/Kingdom';

import graphQLClient from '../graphql_client';

const kingdomId = 1;
const KINGDOM_QUERY = gql`
{
  Card(id: ${kingdomId}) {
    id
    name
  }
}
`;

const App = () => (
  <ApolloProvider client={graphQLClient}>
    <Query query={KINGDOM_QUERY}>
      {({ loading, error, data }) => {
        // const { kingdom } = data;
        if (loading) { return <p>Loading...</p>; }
        if (error) { return <p>Error :(</p>; }

        // return <Kingdom kingdom={kingdom} />;
        console.log(data); // eslint-disable-line no-console
      }}
    </Query>
  </ApolloProvider>
);

ReactDOM.render(<App />, document.getElementById('root'));
