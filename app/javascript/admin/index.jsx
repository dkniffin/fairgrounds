import React, { Component } from 'react';
import { Admin, Resource } from 'react-admin';
import buildGraphcoolProvider from 'ra-data-graphcool';

import { CardIcon, CardList, CardShow } from './cards';
import { KingdomIcon, KingdomList, KingdomShow } from './kingdoms';

import graphQLClient from '../graphql_client';

class AdminApp extends Component {
  constructor() {
    super();
    this.state = { dataProvider: null };
  }

  componentDidMount() {
    buildGraphcoolProvider({ client: graphQLClient })
      .then(dataProvider => this.setState({ dataProvider }));
  }

  render() {
    const { dataProvider } = this.state;

    if (!dataProvider) {
      return <div>Loading</div>;
    }

    return (
      <Admin dataProvider={dataProvider}>
        <Resource name="Card" icon={CardIcon} list={CardList} show={CardShow} />
        <Resource name="Kingdom" icon={KingdomIcon} list={KingdomList} show={KingdomShow} />
      </Admin>
    );
  }
}

export default AdminApp;
