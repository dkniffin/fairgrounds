import apiService from './api';

const kingdomsService = {
  rateKingdom(kingdomId, value) {
    return apiService.post(
      `/kingdoms/${kingdomId}/rating`,
      { kingdom: { kingdom_id: kingdomId, value } }
    );
  }
};

export default kingdomsService;
