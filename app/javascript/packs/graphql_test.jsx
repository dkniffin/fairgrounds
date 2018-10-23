import React from 'react';
import ReactDOM from 'react-dom';
import ApolloClient from 'apollo-boost';
import gql from 'graphql-tag';
import { ApolloProvider, Query } from 'react-apollo';

import Kingdom from 'components/Kingdom';

const csrfToken = document.querySelector('meta[name=csrf-token]').getAttribute('content');

const client = new ApolloClient({
  uri: 'http://localhost:3000/graphql',
  request: (operation) => {
    operation.setContext({
      credentials: 'same-origin',
      headers: {
        'X-CSRF-Token': csrfToken
      }
    });
  }
});

const kingdomId = 1;
const KINGDOM_QUERY = gql`
{
  kingdom(id: ${kingdomId}) {
    id
    name
    cards {
      id
      name
      imagePath
    }
  }
}
`;

const App = () => (
  <ApolloProvider client={client}>
    <Query query={KINGDOM_QUERY}>
      {({ loading, error, data }) => {
        const { kingdom } = data;
        if (loading) { return <p>Loading...</p>; }
        if (error) { return <p>Error :(</p>; }

        return <Kingdom kingdom={kingdom} />;
      }}
    </Query>
  </ApolloProvider>
);

ReactDOM.render(<App />, document.getElementById('root'));
