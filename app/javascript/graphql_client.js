import ApolloClient from 'apollo-boost';

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

export default client;
