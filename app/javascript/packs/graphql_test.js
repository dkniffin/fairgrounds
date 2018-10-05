import ApolloClient from 'apollo-boost';
import gql from 'graphql-tag';

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


client.query({
  query: gql`
    query Meh {
      cards {
        id
        name
      }
    }
  `
})
  .then(data => console.log(data))
  .catch(error => console.error(error));
